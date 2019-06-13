#include<stdio.h>
struct entry{
	int key;
	int value;
	struct entry *next;
};
int search(int key, struct entry *list){
	struct entry x = *list;
	while (x.next != NULL) {
		if ( key == x.key) {
			printf("%d", x.value);
			return 0;
			break; }
		x = *x.next;
	 }
	return 0;
}
void main() {
	struct entry el1;
	struct entry el2;
	struct entry el3;
	el1.key = 1;
	el1.value = 10;
	el2.key = 2;
	el2.value = 20;
	el3.key = 3;
	el3.value = 30;
	el1.next = &el2;
	el2.next = &el3;
	
	search(3, &el1);

}
