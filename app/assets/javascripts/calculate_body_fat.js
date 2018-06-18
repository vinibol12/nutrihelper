
var skinFolds = [
  'subscapular',
  'triceps',
  'axilla',
  'abdominal',
  'iliac_crest',
  'chest',
  'thigh'
];

var sex = 'female';

var age = 22;

function foldsValues() {
  var foldsList = [];
  for (var i = 0; i < skinFolds.length; i++) {
    var item = skinFolds[i];
    var fieldValue = $("[id$=" + item + "]")[0].value;
    foldsList.push(parseInt(fieldValue))
  }
  return foldsList
}

function foldsSum(foldsValues) {
  return foldsValues.reduce(function(total, number) {
    return total + number;
  });
}

function maleBodyDensity(foldsSum, age) {
  return 1.1120 - (0.00043499 * foldsSum) + (0.00000055 * (foldsSum * foldsSum)) - (0.0002882 * age);
}

function femaleBodyDensity(foldsSum, age) {
  return 1.0970 - (0.00043499 * foldsSum) + (0.00000055 * (foldsSum * foldsSum)) - (0.0002882 * age);
}

function BodyDensity() {
  if(sex === 'female') {
     return femaleBodyDensity(foldsSum(foldsValues()), age)
  }
  else {
     return maleBodyDensity(foldsSum(), age)
  }
}

function bodyFatPercentage() {
  return ((4.95 / BodyDensity()) - 4.50) * 100;
}

function setBodyFatPercentage(fatPercentage) {
    $('#anthropometric_evaluation_fat_percentage').val(fatPercentage.toFixed(2))
}

function getWeight() {
  return parseInt($('#anthropometric_evaluation_weight')[0].value)
}

function getHeight() {
  return parseInt($('#anthropometric_evaluation_height')[0].value)
}

function calculateBodyFatWeight (fatPercentage) {
  return (getWeight() / 100) * fatPercentage;
}
function setBodyFatWeight(bodyFatWeight) {
  $('#anthropometric_evaluation_fat_mass').val(bodyFatWeight.toFixed(2))
}

function calculateLeanMass(weight, fatWeight) {
  return weight - fatWeight
}

function setLeanMass(leanMass) {
  $('#anthropometric_evaluation_lean_mass').val(leanMass.toFixed(2))
}

function calculateBMI(weight, height) {
  return (weight/(height/100) / (height/100))
}

function setBMI(bMI) {
  $('#anthropometric_evaluation_bmi').val(bMI.toFixed(1))
}

function calculateBodyCompositions() {
  var fatPercentage = bodyFatPercentage();
  setBodyFatPercentage(fatPercentage);
  var fatWeight = calculateBodyFatWeight(fatPercentage)
  setBodyFatWeight(fatWeight);
  var leanMass = calculateLeanMass(getWeight(), fatWeight);
  setLeanMass(leanMass);
  var bMI = calculateBMI(getWeight(), getHeight());
  setBMI(bMI);
}

$(document).ready(function(){
 $('#new_anthropometric_evaluation').change(function(){
   calculateBodyCompositions();
 })
})





