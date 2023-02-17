// CS 271 -       PA 7
// Program Name:  bst.h
// Author:        Marco Andres Gomez Fierro
// Date:          10/21/2021
// Purpose:       Header File

#ifndef BST_H
#define BST_H

//#include <string>
//using namespace std;


//  prototype - contains the header
//  information for a function

typedef struct treeNode TreeNode;
typedef TreeNode * TreeNodePtr;

struct treeNode {
    struct treeNode * leftPtr;
    int data;
    struct treeNode * rightPtr;

};//end of struct treeNode

void insertNode(TreeNodePtr *treePtr, int value);
void inOrder(TreeNodePtr treePtr);
void preOrder(TreeNodePtr treePtr);
void postOrder(TreeNodePtr treePtr);

#endif
