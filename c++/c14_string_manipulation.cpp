#include <iostream>
#include <iomanip>
#include <sstream>

void c14_string_manipulation()
{
	using namespace std;

	stringstream s;
	string blah(to_string(1234));
	s << quoted(string(blah));

	cout << "Quoted: " << s.str() << endl;
}
