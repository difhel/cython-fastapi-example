#include <Python.h>

int main(int argc, char *argv[]) {
    // Initializing the Python interpreter
    Py_Initialize();

    // Executing the compiled library
    PyObject *pName, *pModule, *pDict, *pFunc, *pValue;

    pName = PyUnicode_DecodeFSDefault("main.cpython-310-x86_64-linux-gnu");
    pModule = PyImport_Import(pName);
    pDict = PyModule_GetDict(pModule);
    pFunc = PyDict_GetItemString(pDict, "root");
    pValue = PyObject_CallObject(pFunc, NULL);

    // Terminating the Python interpreter
    Py_Finalize();

    return 0;
}
