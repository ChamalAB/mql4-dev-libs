//+------------------------------------------------------------------+
//|                                              NoCustomization.mq4 |
//|                                Copyright 2021, Chamal Abayaratne |
//|                                      https://github.com/ChamalAB |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, Chamal Abayaratne"
#property link      "https://github.com/ChamalAB"
#property version   "1.00"
#property strict

#include <Logger.mqh>

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   DEBUG("This will not produce any action");
   INFO("This info will generate a line in the expert tab");
   
   // close non-existant trade
   if(!OrderClose(-999999,0.01,1,1))
      ERROR("This error will generate an alert with the error description instead of error number");
  }
//+------------------------------------------------------------------+
