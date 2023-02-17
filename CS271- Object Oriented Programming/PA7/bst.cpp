// CS 271 -       PA 7
// Program Name:  bst.cpp
// Author:        Marco Andres Gomez Fierro
// Date:          10/04/2021
// Purpose:       Source File


#include "bst.h"
#include <iostream>
#include <iomanip>
#include <cstdlib>
using namespace std;

void insertNode(TreeNodePtr *treePtr, int value){

    // if tree is empty
    if (*treePtr == NULL) {
        *treePtr = (TreeNodePtr) malloc ( sizeof(TreeNode) );

        // if memory was allocated, then assign data
        if (*treePtr != NULL) {
            (*treePtr)->data = value;
            (*treePtr)->leftPtr = NULL;
            (*treePtr)->rightPtr = NULL;

        }//end of if

        else {
            cout << value << " not inserted. No memory available." << endl;

        }//end of else

    }//end of if

    else { // tree is not empty

        // data to insert is less than data in current node
        if (value < (*treePtr)->data) {

            insertNode(&((*treePtr)->leftPtr), value);

        }//end of if

        // data to insert is greater than data in current node
        else if (value > (*treePtr)->data) {

            insertNode(&((*treePtr)->rightPtr), value);

        }//end of else if

        else { // duplicate data value ignored

            cout << "dup";

        }//end of else
    }//end of else
}//end of insertNode


void inOrder( TreeNodePtr treePtr)
{
    //if tree is not empty, then traverse
    if( treePtr != NULL ){
        inOrder( treePtr -> leftPtr);
        cout << setw(3) << (treePtr->data);
        inOrder(treePtr->rightPtr);
    }//end of if
}//end of inOrder


void preOrder(TreeNodePtr treePtr)
{
    // if tree is not empty, then traverse
    if (treePtr != NULL) {
        cout << setw(3) << (treePtr->data);
        preOrder(treePtr->leftPtr);
        preOrder(treePtr->rightPtr);
    }//end of if
}//end of preOrder


void postOrder(TreeNodePtr treePtr)
{
    // if tree is not empty, then traverse
    if (treePtr != NULL) {
        postOrder(treePtr->leftPtr);
        postOrder(treePtr->rightPtr);
        cout << setw(3) << (treePtr->data);
    }//end of if
}//end of postOrder
