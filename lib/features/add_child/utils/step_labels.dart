import '../../../core/utils/ordinals.dart';

List<String> generateStepsLabels(int count){
  List<String> labels=[];
  for(int i=0;i<count;i++){
    labels.add('${ordinals[i]!} child');
  }
  labels.add('Finish');
  return labels;
}