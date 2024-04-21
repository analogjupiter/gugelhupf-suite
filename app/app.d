module app;

import std.path;
import std.stdio;

int main(string[] args) {
	int exitCode;

	string basename = baseName(args[0]).stripExtension();
	bool ranByBaseName = tryRunApp(basename, args, exitCode);
	if (ranByBaseName) {
		return exitCode;
	}

	if (args.length > 1) {
		bool ranByArg1 = tryRunApp(args[1], args[1 .. $], exitCode);
		if (ranByArg1) {
			return exitCode;
		}
	}

	writeln("Gugelhupf Suite :: App Launcher");
	return 1;
}

bool tryRunApp(string name, string[] args, out int exitCode) {

	switch (name) {
	default:
		return false;

	case "scheidlworks": {
			import scheidlworks.cli;

			exitCode = runScheidlWorks(args);
			return true;
		}
	}
}
