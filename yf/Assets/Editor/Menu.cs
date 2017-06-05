using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class Menu : MonoBehaviour {

    [MenuItem("MyMenu/Do something")]
    static void DoSomething()
    {
        Debug.Log("Doing Something...");
    }

    [MenuItem("MyMenu/Log Selected Transform Name")]
    static void LogSelectedTransformName()
    {
        Debug.Log("Selected Transform is on" + Selection.activeTransform.gameObject.name + ".");
    }

    [MenuItem("MyMenu/Log Selected Transform Name", true)]
    static bool ValidateLogSelectedTransformName()
    {
        return Selection.activeTransform != null;
    }

    [MenuItem("MyMenu/DO Something with a ShortCut Key %g")]
    static void DO()
    {
        Debug.Log("ddd");
    }

    [MenuItem("GameObject/MyCategory/Custom Game Object", false, 1)]
    static void sss()
    {

    }
}

