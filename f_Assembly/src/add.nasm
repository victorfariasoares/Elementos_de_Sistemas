
leaw $1, %A
movw (%A), %D
leaw $0, %A
addw %D, (%A), %D
leaw $2, %A
movw %D, (%A)