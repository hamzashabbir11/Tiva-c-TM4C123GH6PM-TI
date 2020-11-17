#define LED_RED (1U<<1)
#define LED_BLUE (1U<<2)
#define LED_GREEN (1U<<3)
#define SYSCTL_RCGCGPIO_R *((unsigned int *) 0x400FE608U ) // Clock Gating 
#define SYSCTL_GPIOHBCTL_R *((volatile unsigned long *) 0x400FE06C ) // Direction AHB for GPIO F
#define GPIO_PORTF_DIR_R  *((unsigned int *)0x40025400U) //GPIO In or Out
#define GPIO_PORTF_DEN_R *((unsigned int *)0x4002551CU)  //Analog or Digital 
#define GPIO_PORTF_DATA_BITS_R  ((volatile unsigned long *)0x40025000)
#define GPIO_PORTF_AHB_DATA_BITS_R \ ((volatile unsigned long *)0x4005D000)

int main()
{
	    //SYSCTL_RCGCGPIO_R = 0x20U;  /* enable clock for GPIOF */
    //GPIO_PORTF_DIR_R = 0x0EU; // set pins 1,2, and 3 as outputs
    //GPIO_PORTF_DEN_R = 0x0EU;
    SYSCTL_RCGCGPIO_R |= (1U << 5);  /* enable clock for GPIOF */
    SYSCTL_GPIOHBCTL_R |= (1U << 5); /* enable AHB for GPIOF */
    GPIO_PORTF_DIR_R |= (LED_RED | LED_BLUE | LED_GREEN);
    GPIO_PORTF_DEN_R |= (LED_RED | LED_BLUE | LED_GREEN);

    //*((unsigned long volatile *)(0x40025008)) = 0x2;//LED_RED;
    //*((unsigned long volatile *)(0x40025000 + (LED_RED << 2))) = LED_RED;
    GPIO_PORTF_DATA_BITS_R[LED_RED] = LED_RED;
    //  GPIO_PORTF_AHB_DATA_BITS_R[LED_RED] = LED_RED;


while (1)
	
	{
       GPIO_PORTF_DATA_BITS_R[LED_RED] = LED_RED;
  	//GPIO_PORTF_DATA_R = 0x08U;
        int volatile counter = 0;
        while (counter < 1000000) {  // delay loop
            ++counter;
        }
       GPIO_PORTF_DATA_BITS_R[LED_RED] = 0x00U;
        counter = 0;
        while (counter < 1000000) {  // delay loop
            ++counter;
        }
    }
    //return 0;
	}