#include <cstdlib>
#include <iostream>
#include <cstdio>
#include <string>
#include <array>
#include <stdexcept>
#include <memory>
#include <sstream>
#include <fstream>
using namespace std;

string exec(const char* cmd) {
    array<char, 128> buffer;
    string result;
    unique_ptr<FILE, decltype(&pclose)> pipe(popen(cmd, "r"), pclose);
    if (!pipe) {
        throw runtime_error("popen() failed!");
    }
    while (fgets(buffer.data(), buffer.size(), pipe.get()) != nullptr) {
        result += buffer.data();
    }
    return result;
}

int main(int argc, char **argv) {
	string home_dir = getenv("HOME");
	ifstream t(home_dir + "/.notif-val");
	if(t.fail()) {
		string errs = "touch " + home_dir + "/.notif-val";
		system(errs.c_str());
		exit(0);
	}
	stringstream buf;
	buf << t.rdbuf();
	string oup = buf.str();
	if(oup.length() == 0) { oup = "0"; }
	t.close();
	string pm_val = exec("pamixer --get-volume-human");
	string k;
	pm_val.pop_back();
	if(pm_val == "muted") {
		k = "notify-send -i ~/Downloads/volume-up-interface-symbol.png MUTED -p -r " + oup;
	} else {
		k = "notify-send -i ~/Downloads/volume-up-interface-symbol.png " + pm_val + " -h int:value:" + pm_val + " -p -r " + oup;
	}
	oup = exec(k.c_str());
	ofstream o(home_dir + "/.notif-val");
	o << oup;
	o.close();
	return 0;
}
