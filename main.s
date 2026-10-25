.intel_syntax noprefix
.global func

.text
// void func(int64_t* input_array, size_t size)
// rdi - pointer
// rsi - size
func:
    test rdi, rdi
    jz .done

    cmp rsi, 1
    jbe .done

    mov r10, rsi
    sub r10, 1

.outer_loop:
    test r10, r10
    jz .done

    xor r11, r11

.inner_loop:
    cmp r11, r10
    je .inner_done

    mov r8, [rdi + r11*8]
    mov r9, [rdi + r11*8 + 8]
    cmp r8, r9
    jle .finish
    mov [rdi + r11*8], r9
    mov [rdi + r11*8 + 8], r8

.finish:
    inc r11
    jmp .inner_loop

.inner_done:
    dec r10
    jmp .outer_loop

.done:
    ret

# gavnooooooooooooooooooooooooooooooooooooooooooooooooo
# kallllllllllllllllllllllll
