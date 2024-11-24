#include <linux/init_task.h>
#include <linux/module.h>

#include "pid.h"

MODULE_DESCRIPTION(
    "Print page tables chains for all virtual memory pages in process");
MODULE_LICENSE("GPL");

static void print_page_table_chain(unsigned long vaddr,
                                   struct mm_struct *task_mm) {
  pgd_t *pgd = pgd_offset(task_mm, vaddr);
  unsigned long pg = pgd_val(*pgd);
  if (pgd_none(*pgd) || pgd_bad(*pgd))
    return;

  p4d_t *p4d = p4d_offset(pgd, vaddr);
  unsigned long p4 = p4d_val(*p4d);
  if (p4d_none(*p4d) || p4d_bad(*p4d))
    return;

  pud_t *pud = pud_offset(p4d, vaddr);
  unsigned long pu = pud_val(*pud);
  if (pud_none(*pud) || pud_bad(*pud))
    return;

  pmd_t *pmd = pmd_offset(pud, vaddr);
  unsigned long pm = pmd_val(*pmd);
  if (pmd_none(*pmd) || pmd_bad(*pmd))
    return;

  pte_t *pte = pte_offset_kernel(pmd, vaddr);
  unsigned long pt = pte_val(*pte);
  if (pte_none(*pte))
    return;

  unsigned long paddr = 0;
  unsigned long page_addr = 0;
  unsigned long page_offset = 0;
  page_addr = pte_val(*pte) & PAGE_MASK;
  page_offset = vaddr & ~PAGE_MASK;
  paddr = page_addr | page_offset;
  printk("  PGD   ->   P4D    ->   PUD   ->   PMD   ->    PTE    ->    Phys "
         "addr \n");
  printk("%8lx  %8lx  %8lx  %8lx  %8lx  %8lx \n", pg, p4, pu, pm, pt, paddr);
}

static int init(void) {
  printk("_______________________Start page table "
         "module!_______________________\n");
  pid_t process_pid = PID;

  struct pid *pid_pt = find_get_pid(process_pid);
  if (!pid_pt) {
    printk("Pid %d is not found\n", process_pid);
    return 0;
  }

  struct task_struct *task = pid_task(pid_pt, PIDTYPE_PID);
  if (!task) {
    printk("Task with pid %d is not found\n", process_pid);
    return 0;
  }

  printk("_____________________________Pid: %d_____________________________\n",
         task->pid);
  struct mm_struct *task_mm = task->mm;
  if (task_mm == NULL) {
    printk("Can't find task->mm\n");
    return 0;
  }

  struct vm_area_struct *vma;
  int num_page = 0;
  for (vma = task_mm->mmap; vma; vma = vma->vm_next) {
    unsigned long vmpage = vma->vm_start;
    printk("%d. page : %8lx\n", num_page++, vmpage);
    print_page_table_chain(vmpage, task_mm);
  }

  printk("%d. vmalloc page : %8lx\n", num_page++, VMALLOC_START);
  print_page_table_chain(VMALLOC_START, task_mm);

  return 0;
}

static void exit(void) {
  printk("______________________End page table "
         "module!__________________________\n");
}

module_init(init);
module_exit(exit);
