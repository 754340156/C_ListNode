//
//  main.m
//  Node
//
//  Created by 赵哲 on 2017/4/28.
//  Copyright © 2017年 赵哲. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef struct NODE
{
    int data;//数据域
    struct NODE * next;//指针域
}* Node;
//创建单链表
Node create_listNode();
//遍历
void traverse_listNode(Node node);
//判断是否是空
bool is_empty(Node node);
//链表长度
int lenth_list(Node node);
//插入(链表，位置，插入的值)
void insert_list(Node node ,int index,int data);
//删除(链表，位置，接收删除的值得指针)
void delete_list(Node node ,int index, int *pData);
//排序
void sort_list(Node node);

int main(int argc, const char * argv[]) {

    Node node = NULL;
    node = create_listNode();
    traverse_listNode(node);
    
    if (is_empty(node)) {
        printf("链表为空\n");
    }
    else
    {
        printf("链表不为空\n");
    }
    
    printf("链表的长度：%d\n",lenth_list(node));
    
    
//    sort_list(node);
//    traverse_listNode(node);
    
//    insert_list(node, 0, 6);
    
    delete_list(node, 2, NULL);
    traverse_listNode(node);
    return 0;
}
//创建单链表
Node create_listNode()
{
    
    int len;//用来存放有效节点的个数
    int val;//存放链表中的值
    
    //头节点
    Node head = (Node)malloc(sizeof(Node));
    if (head == NULL) {
        printf("分配失败");
        exit(-1);
    }
    
    //永远是下一个节点
    Node tail = head;
    //清空指向下一个节点的指针
    tail->next = NULL;
    
    printf("请输入生成链表节点的长度：len - ");
    scanf("%d",&len);
    
    for (int i = 0; i < len; i++) {
        printf("请输入第%d个节点的值：",i);
        scanf("%d",&val);
        
        Node new = (Node)malloc(sizeof(Node));
        if (new == NULL) {
            printf("分配失败");
            exit(-1);
        }
        new->data = val;
        tail->next = new;
        new->next = NULL;
        tail = new;
    }
    return (head) ;
}
//遍历
void traverse_listNode(Node node)
{
    Node p = node->next;
    while (p != NULL) {
        printf("%d    ",p->data);
        p = p->next;
    }
    printf("\n");
}
//判断是否是空
bool is_empty(Node node)
{
    //头结点指针域空
    if (node->next == NULL) {
        return true;
    }
    return false;
}
//链表长度
int lenth_list(Node node)
{
    Node p = node->next;
    int len = 0;
    while (p != NULL) {
        len++;
        p = p->next;
        
    }
    return len;
}
//插入(链表，位置，插入的值)
void insert_list(Node node ,int index,int data)
{
    int i = 0;
    Node p = node;
    
    while (p != NULL && i < index - 1) {
        p = p->next;
        i++;
    }
    
    if (i > index - 1 || p == NULL) {
        printf("插入索引错误");
        exit(-1);
    }
    
    Node new = (Node)malloc(sizeof(Node));
    if (new == NULL) {
        printf("分配内存失败");
        exit(-1);
    }
    new->data = data;
    Node  q = p->next;
    p->next = new;
    new->next = q;
}
//删除(链表，位置，接收删除的值得指针)
void delete_list(Node node ,int index, int *pData)
{
    int i = 0;
    Node p = node;
    
    while (p->next != NULL && i < index - 1) {
        p = p->next;
        i++;
    }
    
    if (i > index - 1 || p->next == NULL) {
        printf("插入索引错误");
        exit(-1);
    }
    
    Node q = p->next;
    pData = &q->data;
    p->next = p->next->next;
    free(q);
    q = NULL;
}
//排序
void sort_list(Node node)
{
    int i ,j;
    int len = lenth_list(node);
    Node p,q;
    
    for (i = 0 ,p = node->next; i < len - 1 ; i++,p = p->next) {
        for (j = i + 1,q = p->next; j < len; j++,q = q->next) {
            if (p->data > q->data) {
                int temp = p->data;
                p->data = q->data;
                q->data = temp;
            }
        }
    }
}
