#include <iostream>
#include <vector>
#include <string>

#include "bitmap.h"

namespace asc
{
	using namespace std;

	// Constructor
	bitmap::bitmap(const unsigned int w, const unsigned int h)
		: width(w)
		  , height(h)
		  , bm(h, vector<bool>(w, false))
	{
	}

	// Add a point to the bitmap
	void bitmap::set(const unsigned int x, const unsigned int y)
	{
		// TBD - check limits
		auto _x = min(x, width);
		auto _y = min(y, height);

		bm[height - _y - 1][_x] = true;
	}

	// Render bitmap
	void bitmap::render()
	{
		// Bitmap
		cout << "^" << endl;
		for (const auto r:bm)
		{
			cout << "|";

			for (auto b:r)
				cout << (b ? '*' : ' ');

			cout << endl;
		}

		// X axis
		cout << "0" << string(width, '-') << ">" << endl;
	}
}
