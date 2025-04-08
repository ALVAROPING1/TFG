.text
main: li t0, 0
      li t1, 10
      li t2, 0
loop: beq t0, t1, end
      add t2, t2, t0
      addo t0, t0, 1
      j loop
end:  mv a0, t2
