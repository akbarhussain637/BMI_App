import 'package:bmi_app/colculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constant.dart';
import 'resultpage.dart';
import 'package:bmi_app/Roundiconbutton.dart';
import 'package:bmi_app/Botton_Button.dart';
import 'colculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //used ternary operator
  Gender? selectgender;
  int height = 180;
  int weight= 60;
  int age=20;
  //used if else statment
  /*Color maleCardcolor=inactiveCardColor;
  Color femaleCardcolor=inactiveCardColor;
  void updatecolor(Gender selectgender){
    if(selectgender==Gender.male){
      if(maleCardcolor==inactiveCardColor){
        maleCardcolor=activeCardColor;
        femaleCardcolor=inactiveCardColor;
      }else{
        maleCardcolor=inactiveCardColor;
      }
    }
    else{
      if(femaleCardcolor==inactiveCardColor){
        femaleCardcolor=activeCardColor;
        maleCardcolor=inactiveCardColor;
      }else{
        femaleCardcolor=inactiveCardColor;
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectgender = Gender.male;
                      });
                    },
                    colour: selectgender == Gender.male
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectgender = Gender.female;
                      });
                    },
                    // colour:femaleCardcolor,
                    colour: selectgender == Gender.female
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: klabeltextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: knumbertextstyle,
                      ),
                      Text(
                        'cm',
                        style: klabeltextstyle,
                      )
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Colors.pink,
                      inactiveColor: Colors.white,
                      onChanged: (double newvalue){
                        setState(() {
                          height=newvalue.round();
                        });

                      }
                  )
                ],
              ),
              colour: kactiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: klabeltextstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: knumbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           RoundiconButton(
                             icon: FontAwesomeIcons.minus,
                             onpressed: (){
                               setState(() {
                                 weight--;
                               });
                             },
                           ),
                            SizedBox(
                             width: 10.0,
                            ),
                          RoundiconButton(
                            icon: FontAwesomeIcons.plus,
                            onpressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          ],
                        )

                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      children: [
                        Text(
                          'Age',
                          style: klabeltextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: knumbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundiconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundiconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottonButton(
            buttontitle: 'COLCULATE',
            onTop: (){
              Colculatorbrain colc=Colculatorbrain(height: height,weight: weight);
                Navigator.push(context, MaterialPageRoute( builder: (context) =>Result_page(
                  bmiresult: colc.colculatebmi(),
                  textresult: colc.getresult(),
                  interpreation: colc.getinterpreation(),
                ),),);
            },
          ),
        ],
      ),
    );
  }
}



