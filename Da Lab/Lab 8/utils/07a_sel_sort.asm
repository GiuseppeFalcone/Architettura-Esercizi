# #############################################################################
# Esercizio 7 – SELECTION SORT
# 
# #############################################################################

.globl _start

.data
  size:   .word 4
  array:  .word 3, 1, 5, 2


.text
_start:
  la a0, array      # load the vector address
  la a1, size       # indirizzo array[0]; base dell'array
  lw a3, 0(a1)      # a3 size dell'array
  addi a2, a1, 4    # indirizzo array[1]

  jal selection_sort

  jal is_sorted     # returns either 1 (TRUE) or 0 (FALSE) through a0
  li a7, 1
  ecall

exit:
  li a7, 10
  ecall


# #############################################################################
# void selectionSort(int array[], int size){
#   int i, j, min_idx;
#
#   for (i = 0; i < size-1; i++) {
#     min_idx = i;
#     for (j = i+1; j < size; j++) {
#       if (array[j] < array[min_idx]) {
#         min_idx = j;
#       }
#     }
#     swap(&array[min_idx], &array[i]);
#   }
# }
# #############################################################################
# 
# a0 -> array address
# a3 -> size value
selection_sort:
  addi sp, sp, -8
  sd ra, 0(sp)

  li t6, 4                        # passo incremento
  li t1, 0                        # i = 0
                                  
  addi a4, a3, -1                 # size-1
  outer_loop:                     
    mv t3, t1                     # min_idx = i;
    beq t1, a4, end_outer_loop    # while (i < size-1)
    addi t2, t1, 1                # j = i+1;
    inner_loop:
      beq t2, a3, end_inner_loop  # while(j < size)
      
      # 
      mul t4, t2, t6              # offset for j
      mul t5, t3, t6              # offset for min_idx
      add t4, a0, t4              # get address for &array[j]
      lw a5, 0(t4)                # get value array[j]
      add t5, a0, t5              # get address for &array[min_idx]
      lw a6, 0(t5)                # get value array[min_idx]
      
      bge a5, a6, step_on # step_on if (array[j] < array[min_idx]); otherwise
      mv t3, t2                   # min_idx = j;
      
      step_on:
        addi t2, t2, 1   # j++
        j inner_loop
    end_inner_loop:
      # beq t1, t3, after_inner_loop # se indici uguali evitiamo swap

      mul t5, t3, t6      # t3 indice min_idx; t6 passo incremento; t5 offset
      mul t4, t1, t6      # t1 indice i; t6 passo incremento; t4 offset
      add a1, a0, t5      # indirizzo &array[min_idx]
      add a2, a0, t4      # indirizzo &array[i]  
      
      # swap(&array[min_idx], &array[i]); 
      jal swap              # parameters passed through a1 and a2
      
    after_inner_loop:
      addi t1, t1, 1        # ++i;
      j outer_loop

    end_outer_loop:
      ld ra, 0(sp)
      addi sp, sp, 8
      jr ra  




# #############################################################################
# void swap(int *a, int *b) {
#   int temp = *a;
#   *a = *b;
#   *b = temp;
# }
# 
# #############################################################################
# a1 --> indirizzo a
# a2 --> indirizzo b
# 
# #############################################################################
swap:
  addi sp, sp, -16    # save
  sd ra, 0(sp)        # save
  sw t1, 8(sp)        # save
  sw t2, 12(sp)       # save

  lw t1, 0(a1)        # load value of array[min_idx]
  lw t2, 0(a2)        # load value of array[i]
  
  sw t1, 0(a2)        # *a = *b;
  sw t2, 0(a1)        # *b = temp;

  ld ra, 0(sp)        # restore
  lw t1, 8(sp)        # restore
  lw t2, 12(sp)       # restore
  addi sp, sp, 16     # restore
  jr ra


# ########################################################################
# 
# int is_sorted(int* array, int size){
#   int idx = 1;
#   int last = array[0];
#
#   while(idx < size){
#     if(array[idx] < last)
#       return 0;
#     last = array[idx];
#     ++idx;
#   }
#   return 1;
# }
# ########################################################################
# 
# a0 -> array address
# a3 -> size
# ########################################################################
is_sorted:
  addi sp, sp, -16        # save
  sd ra, 0(sp)            # save
  sw t0, 8(sp)
  sw t1, 12(sp)
  
  
  li t0, 1                # int idx = 1;
  lw t1, 0(a0)            # t1 contiene last
                          # int last = array[0];

  loop:
    beq t0, a3, endloop   # while(idx < size)
    addi a0, a0, 4        # offset 2 add to the base address 
                          # to get address of next elem on array
    lw a2, 0(a0)          # prelevo l'iesimo elemento dall'array
    blt a2, t1, return_0  # if(array[idx] < last)
    lw t1, 0(a0)          # aggiorno last
    addi, t0, t0, 1       # ++idx;
    j loop


  endloop: # se non sono ancora uscito, ritorno TRUE, 1
    li a0, 1
    
    ld ra, 0(sp)
    lw t0, 8(sp)
    lw t1, 12(sp)
    addi sp, sp, 16
    jr ra


  return_0:
    li a0, 0

    ld ra, 0(sp)
    lw t0, 8(sp)
    lw t1, 12(sp)
    addi sp, sp, 8
    jr ra











  