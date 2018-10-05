
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
mov ch, 12d
mov cl, 40d

start:    
    ; Set cursor position
    mov ah, 2
    mov dh, ch
    mov dl, cl
    int 10h
                         
    ; Print *
    mov ah, 2
    mov dl, '*'
    int 21h      
    
    ; Read character from character
    mov ah, 7
    int 21h
    push ax
    
    ; Set cursor position
    mov ah, 2
    mov dh, ch
    mov dl, cl
    int 10h    
    
    ; Clear value
    mov ah, 2
    mov dl, ' '
    int 21h      
    
    pop ax   
            
    ; Switch        
    ; Stop program
    cmp al, 'q'
    je stop
         
    ; Run up if keypress is w
    cmp al, 'w'
    je up                    
    
    ; Run up if keypress is s
    cmp al, 's'
    je down                  
    
    ; Run up if keypress is a
    cmp al, 'a'
    je left                  
    
    ; Run up if keypress is d
    cmp al, 'd'
    je right
                             
    ; Restart program
    jmp start
       
           
; Move snake up
up:              
    ; Check if at top of screen
    cmp ch, 0                  
    je rollDown
                               
    ; Move up cursor
    dec ch
    jmp start  
    
    
; Move snake down
down:       
    ; Check if at bottom of screen    
    cmp ch, 23d
    je rollUp
    
           
    ; Move down cursor
    inc ch
    jmp start
               
               
; Move snake left
left:      
    ; Check if at left of screen      
    cmp cl, 0
    je rollRight
                
    ; Move left cursor
    dec cl
    jmp start
          
          
; Move snake right
right:   
    ; Check if at right of screen  
    cmp cl, 79d
    je rollLeft
        
    ; Move right cursor
    inc cl
    jmp start
                
          
; Reset to bottom of screen       
rollDown:
    mov ch, 23d
    jmp start    
    
; Reset to top of screen
rollUp:
    mov ch, 0
    jmp start
    
; Reset to right of screen    
rollRight:
    mov cl, 79d
    jmp start

; Reset to left of screen
rollLeft:   
    mov cl, 0
    jmp start 



; Start snake            
jmp start  

stop:
          
ret   