#include <featureTests.h>
#ifdef ROSE_ENABLE_CONCOLIC_TESTING

static const char* purpose = "Monitors the execution of some program and computes some coverage number.";

static const char* description =
    "Monitors the execution of a program and produces some coverage number. "
    "The coverage number is an estimate how many unique instructions were executed. "
    "To this end, execmon traces the execution and records code "
    "intervals. Code intervals are non-overlapping, contiguous code segments.\n";

#include <algorithm>
#include <set>
#include <fstream>

#include <sage3basic.h>
#include <Rose/BinaryAnalysis/Debugger/Linux.h>
#include <Rose/CommandLine.h>
#include <Rose/Diagnostics.h>
#include <Rose/BinaryAnalysis/Partitioner2/Engine.h>

namespace P2 = Rose::BinaryAnalysis::Partitioner2;

using namespace Sawyer::Message::Common;


//
// globals

Sawyer::Message::Facility mlog;

//
// core functionality

namespace Rose {
namespace BinaryAnalysis {

struct ExecutionMonitor: Debugger::Linux {
    typedef rose_addr_t                  addr_t;
    typedef std::set<addr_t>             AddressSet;

    ExecutionMonitor(const std::vector<std::string>& exeNameAndArgs)
        : addresses() {
        Debugger::Linux::Specimen specimen(exeNameAndArgs);
        specimen.flags().set(Debugger::Linux::Flag::CLOSE_FILES);
        attach(specimen);
    }

    /** Returns the current program counter (PC). */
    addr_t pc() {
        return executionAddress(Debugger::ThreadId::unspecified());
    }

    /** Executes a single instruction and manages the instruction range interval. */
    void step(Debugger::ThreadId);

    /** Runs the program to termination. */
    void run();

    /** Returns an estimated number of unique instructions executed during the program run. */
    size_t estimateDistinctInstructionBytes() const {
        return addresses.size();
    }

private:
    AddressSet addresses;                               /**< all code intervals */
};

void
ExecutionMonitor::step(Debugger::ThreadId tid) {
    addresses.insert(pc());

    // make a move
    singleStep(tid);
}

void
ExecutionMonitor::run() {
    while (!isTerminated())
        step(Debugger::ThreadId::unspecified());
}

} // namespace
} // namespace

// command line and option handling

struct Settings
{
  Settings()
  : outputFileName(), disassembler(true)
  {}

  boost::filesystem::path outputFileName;
  bool                    disassembler;
};

Sawyer::CommandLine::Parser
buildCommandLineParser(Settings &settings) {
  using namespace Sawyer::CommandLine;

  SwitchGroup out("Output switches");

  out.insert(Switch("output", 'o')
             .argument("file", anyParser(settings.outputFileName))
             .doc("Write the result to the specified file.")
             );

  return Rose::CommandLine::createEmptyParser(purpose, description).with(out);
}


int main(int argc, char** argv)
{
  using Rose::BinaryAnalysis::ExecutionMonitor;
  using namespace Rose::BinaryAnalysis::Disassembler;

  ROSE_INITIALIZE;
  Rose::Diagnostics::initAndRegister(&::mlog, "tool");

  Settings                 settings;
  Sawyer::CommandLine::Parser parser = buildCommandLineParser(settings);
  P2::Engine::Ptr engine = P2::Engine::forge(argc, argv, parser /*in,out*/);


  // Parse command-line
  std::vector<std::string> specimen = parser.parse(argc, argv).apply().unreachedArgs();
  if (specimen.empty()) {
      ::mlog[FATAL] << "No specimen given (use --help)\n";
      exit(1);
  }

  // Trace output goes to either std::cout or some file.
  std::filebuf             fb;
  const bool               useFile = !settings.outputFileName.empty();

  if (useFile)
  {
    fb.open(settings.outputFileName.string().c_str(), std::ios::out);
  }

  std::ostream             traceOutput(useFile ? &fb : std::cout.rdbuf());

  ExecutionMonitor         execmon(specimen);

  execmon.run();

  traceOutput << execmon.waitpidStatus() << '\n'
              << execmon.estimateDistinctInstructionBytes()
              << std::endl;

  return 0;
}

#else

#include <iostream>
int main() {
    std::cerr <<"concolic testing is not enabled\n";
}

#endif
