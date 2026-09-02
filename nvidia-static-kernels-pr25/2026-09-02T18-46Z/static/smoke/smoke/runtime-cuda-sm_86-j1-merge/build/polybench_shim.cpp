extern "C" { double _pb_rtclock(); }
double rtclock() { return _pb_rtclock(); }
