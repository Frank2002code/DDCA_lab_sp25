### Aanjhan Ranganathan <raanjhan@inf.ethz.ch>
### For Lab 8 Digital Technik 
### 2014

###   I/O addresses Reference
###  compatible to the compact modelling
###  0x00007FF0   LED output

### Register Usage:
# $t0: 用於儲存當前要顯示在七段顯示器上的圖案 (pattern) 值
# $t2: 作為內部延遲迴圈 (wait loop) 的計數器
# $t3: 儲存延遲迴圈的目標計數值此值會根據開關狀態動態計算
# $t4: 作為指標 (pointer)，指向 pattern 陣列中下一個要讀取的圖案位址偏移量
# $t5: 儲存 pattern 陣列的總長度 (單位為 byte)，用於判斷迴圈是否結束
# $t6: 儲存從 I/O 位址 0x7FF4 讀取到的 2 位元開關狀態


.data
pattern: .word 0x00200000,0x00004000,0x00000080,0x00000001,0x00000002,0x00000004,0x00000008,0x00000400,0x00020000,0x01000000,0x02000000,0x04000000
loopcnt: .word 0x001e8484

.text
   lw $t3, loopcnt    # initialize a  large loopcounter (so that the snake does not crawl SUPERFAST)
   addi $t5,$0,48       # initialize the length of the display pattern (in bytes), **初始化顯示圖案的總長度 (12 個 word * 4 bytes/word = 48 bytes)
   
restart:   
   addi $t4,$0,0

forward:
   # 如果已經顯示完所有圖案 (指標 == 總長度)，則跳回 restart
   beq $t5, $t4, restart
   
   # 從 .data 區載入目前的貪吃蛇圖案到 $t0
   lw $t0, pattern($t4)
   
   # 將圖案指標移至下一個 word (位址+4)，為下一次迴圈做準備
   addi $t4, $t4, 4
   
   # 將圖案值寫入到七段顯示器的 I/O 位址，顯示出來
   sw $t0, 0x7ff0($0)

   # === 延遲控制邏輯 ===

   # 1. 從 I/O 位址讀取 2 位元的開關值
   lw $t6, 0x7ff4($0)

   # 2. 根據開關值計算新的延遲時間
   lw $t3, loopcnt
   srlv $t3, $t3, $t6     # $t3 = $t3 >> $t6, 這會讓延遲時間變短，蛇的速度變快

   # === wait loop ===
   addi $t2, $0, 0        # 清除延遲迴圈的計數器 $t2

wait:
   beq $t2, $t3, forward  # 如果計數器 $t2 等於延遲值 $t3，則跳出迴圈，去顯示下一個圖案
   addi $t2, $t2, 1       # 計數器 +1
   j wait                 # 繼續延遲迴圈