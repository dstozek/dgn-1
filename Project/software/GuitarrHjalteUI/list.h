/*
 * list.h
 *
 *  Created on: 2010-05-30
 *      Author: Dominik Sto¿ek
 */

#ifndef LIST_H_
#define LIST_H_

typedef struct Node {
	void* data;
	struct Node* next;
} LinkedListNode;

typedef struct {
	LinkedListNode* first;
	LinkedListNode* last;
	LinkedListNode* current;
	int count;
} LinkedList;

void list_add(LinkedList* list, void* data);
void list_rewind(LinkedList* list);
void* list_current(LinkedList* list);
void* list_next(LinkedList* list);
int list_hasnext(LinkedList* list);


#endif /* LIST_H_ */
