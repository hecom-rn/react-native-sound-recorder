
import { NativeEventEmitter, NativeModules } from 'react-native';

const { RNSoundRecorder, RNSoundpPeakPower } = NativeModules;

var start = RNSoundRecorder.start;
var subscription;
RNSoundRecorder.start = function(path, options) {
	if(options == null) options = {};
	const calendarManagerEmitter = new NativeEventEmitter(RNSoundpPeakPower);
	subscription = calendarManagerEmitter.addListener(
		'RNSoundRecorder_PeakPower',
		(reminder) => {
			console.log(reminder.peak)
		}
	  );
	return start(path, options);
}

var stop = RNSoundRecorder.stop;
RNSoundRecorder.stop = function() {
	subscription.remove();
	return stop();
}

// RNSoundRecorder.peakPower((cdd)=> {
// 	console.log(cdd);
// })

export default RNSoundRecorder;
