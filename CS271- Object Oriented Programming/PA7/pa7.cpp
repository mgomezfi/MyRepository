// CS 271 -       PA 7
// Program Name:  pa7.cpp
// Author:        Marco Andres Gomez Fierro
// Date:          10/04/2021
// Purpose:       Second Source File


#include "bst.h"
#include <iostream>
#include <iomanip>
#include <cstdlib>

using namespace std;

int main(void) {


    TreeNodePtr rootPtr = NULL; // tree initially empty

    srand(time(NULL));
    cout << "The numbers being placed in the tree are:";

    // insert random values between 0 and 14 in the tree
    for (unsigned int i = 1; i <= 10; ++i) {
        int item = rand() % 15;
        cout << setw(3) << item;
        insertNode( &rootPtr, item);
    }

    // traverse the tree preOrder
    cout << endl << endl << "The preOrder traversal is:";
    preOrder(rootPtr);

    // traverse the tree inOrder
    cout << endl << endl << "The inOrder traversal is:";
    inOrder(rootPtr);

    // traverse the tree postOrder
    cout << endl << endl << "The postOrder traversal is:";
    postOrder(rootPtr);
    cout << endl;

}//end of main
