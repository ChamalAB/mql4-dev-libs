## Logging library for mql4

This is a logging library to quickly add logging capabilities to your code without much hassle. The library's default behavior matches most cases however most of the functionality can be customized using pre-processor substitutions (#define)

See the example scripts on how to use library.

**How to use**
```cpp
#include <Logger.mqh>

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   DEBUG("This id debug");
   INFO("This is info");
   ERROR("This is an error");
  }
//+------------------------------------------------------------------+
```

**Customization notes**

 - The logger uses following format to print logs
```cpp
// [time, except LOGGER_PRINT,LOGGER_ALERT] [level] [prefix] [message] [last error, only Logger::Error]
```
sample output: *2021.06.08 17:35:34 | Error | OnStart | This is a test error | invalid function parameter value*

 - Use following logging functions/digits to assign them to logging levels. define as 0 if the level needs to be disabled
```cpp
#define LOGGER_PRINT    1     // print to log
#define LOGGER_ALERT    2     // trigger alert
#define LOGGER_FILE     4     // write to a file
#define LOGGER_NOTIFY   8     // send a notification
```
example:
```cpp
#define LOGGER_SET_DEBUG 0       // DEBUG is disabled
#define LOGGER_SET_INFO  1|2     // Print and alert
#define LOGGER_SET_ERROR 1|2|4   // Print, alert and file write
```

 - Customize the prefix section as follows
```cpp
#define LOGGER_PREFIX __FILE__ + " | Line:" + IntegerToString(__LINE__) // [filename] | [Line number]
```
an example prefix output will be : *with_customization.mq4 | Line:36*

 - Customize file name by a string constant or a function call
```cpp
#define LOGGER_FILENAME "backtest_debug.log"
// or
#define LOGGER_FILENAME IntegerToString(AccountNumber())
```

**Notes:**

-   ```#define``` before the Logger.mqh is included.
-   To disable a logger level set the level as zero.
-   LOGGER_NOTIFY and LOGGER_FILE execution errors are handled as a print statements. Do not customize it to use library's own error handling, the program might trigger an infinite loop or a stack overflow.

