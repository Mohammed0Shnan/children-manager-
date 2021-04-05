
import 'dart:async';

enum WaitDone{Wait,Done}

class WaitDoneBloC{
  // ignore: close_sinks
  final StreamController<WaitDone> controller = StreamController<WaitDone>.broadcast();
  
 WaitDone defaultState()=> WaitDone.Done;

  toggleToWait(){
   controller.sink.add(WaitDone.Wait);
  }
    toggleToDone(){
   controller.sink.add(WaitDone.Done);
  }

 Stream<WaitDone> get stream=>controller.stream;

}
final WaitDoneBloC waitDoneBloC = WaitDoneBloC();