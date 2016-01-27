/*
 * list.c
 *
 *	A simple linked list implementation for use for the effects and their parameters.
 *
 *  Created on: 2010-05-30
 *      Author: Dominik Sto¿ek
 */
#include "list.h"

void list_add(LinkedList* list, void* data) {
	LinkedListNode* node = malloc(sizeof(LinkedListNode));
	node->data = data;
	node->next = 0;

	if (list->first == 0) list->first = node;
	if (list->last) list->last->next = node;
	list->last = node;
	list->count++;
}
void list_rewind(LinkedList* list) {
	list->current = list->first;
}
void* list_current(LinkedList* list) {
	return list->current?list->current->data:0;
}
void* list_next(LinkedList* list) {
	void* data;
	if (list->current) {
		data = list->current->data;
		list->current = list->current->next;
		return data;
	} else {
		return 0;
	}
}
int list_hasnext(LinkedList* list) {
	return list->current?!!(list->current->next):0;
}
