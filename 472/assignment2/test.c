//This program illustrates floating-point computations

#include <stdio.h>
#include <math.h>

#define N_BITS 32 // word size
#define N_BITS_EXPONENT 8 
#define N_BITS_MANTISSA 23

// converts exponent from binary to decimal
int bin2dec(char binary[])
{
  int i, decimal = 0;
  for (i = 0; i < N_BITS_EXPONENT; i++)
      decimal += binary[N_BITS_EXPONENT - i - 1] * pow(2, i);
  return decimal;
}

// converts exponent from decimal to binary
void dec2bin(int decimal, char binary[])
{
  int i;
  
  // initialize all bits with 0
  for (i = 0; i < N_BITS_EXPONENT; i++)
    binary[i] = 0;

  // convert to binary
  // results are stored in reverse order as they are obtained
  i = 0;
  while (decimal > 0)
    {
      binary[N_BITS_EXPONENT-i-1] = decimal % 2;
      decimal /= 2;
      i++;
    }
}

// forms a floating-point number in mantissa-exponent representation
// from two arrays,
// one representing the mantissa and the other one the exponent.
void gather(char mantissa[], char exponent[], char mantissa_exponent[])
{
  int i;

  // sign bit always 0 in this program
  mantissa_exponent[0] = 0;
  // get the exponent
  for (i = 0; i < N_BITS_EXPONENT; i++)
    mantissa_exponent[i+1] = exponent[i];
  // get the mantissa
  for (i = 0; i < N_BITS_MANTISSA; i++)
    mantissa_exponent[1 + N_BITS_EXPONENT + i] = mantissa[i];
}

// splits a floating point number from mantissa-exponent representation
// into two arrays,
// one for the exponent and one for the mantissa.
void split(char mantissa_exponent[], char mantissa[], char exponent[])
{
  int i;
  // get the exponent
  for (i = 0; i < N_BITS_EXPONENT; i++)
    exponent[i] = mantissa_exponent[i+1];
  //get the mantissa
  for (i = 0; i < N_BITS_MANTISSA; i++)
    mantissa[i] = mantissa_exponent[i+1 + N_BITS_EXPONENT];
}

// converts a double to mantissa-exponent representation
void convert(double x, char mantissa_exponent[])
{
  char mantissa[N_BITS_MANTISSA]; // to store the mantissa
  char exponent[N_BITS_EXPONENT]; // to store the exponent
  int exponent_dec; // exponent in decimal
  int integral_part = (int)x; // split the number in integral and fractional parts
  double frac_part = x - integral_part;
  int n_bits_integral_part = 0; // to store the number of bits of the integral part
  int i;

  // convert the integral part 
  while (integral_part > 0)
    {
      // store the bits from the end of the mantissa, we'll move them later
      mantissa[N_BITS_MANTISSA - n_bits_integral_part - 1] = integral_part % 2;
      integral_part /= 2;
      n_bits_integral_part++;
    }

  // now move all the bits of the mantissa to the front
  // to align them to the left
  for (i = 0; i < n_bits_integral_part; i++)
    mantissa[i] = mantissa[N_BITS_MANTISSA - n_bits_integral_part + i];
  
  // compute the fractional part of the mantissa
  for (i = n_bits_integral_part; i < N_BITS_MANTISSA; i++)
    {
      mantissa[i] = frac_part *= 2;
      frac_part = frac_part - (int)frac_part;
    }


  // compute the exponent in decimal
  exponent_dec = n_bits_integral_part - 1;

  // convert the exponent to binary
  dec2bin(exponent_dec, exponent);

  // assemble the result
  gather(mantissa, exponent, mantissa_exponent);
}

// converts a floating point number
// from mantissa-exponent representation to double
double convert_back(char mantissa_exponent[])
{
  double result = 0; // to store the result
  char mantissa[N_BITS_MANTISSA]; // to store the mantissa
  char exponent[N_BITS_EXPONENT]; // to store the exponent
  int n_bits_integral_part; // number of bits of the integral part
  int exponent_dec; // exponent in decimal
  int i;

  // separate bits
  split(mantissa_exponent, mantissa, exponent);
  
  // convert exponent to decimal
  exponent_dec = bin2dec(exponent);

  // compute the number of bits of the integral part
  n_bits_integral_part = 1 + exponent_dec;
  
  // convert the integral part to decimal
  for (i = 0; i < n_bits_integral_part; i++)
    result += pow (2, n_bits_integral_part -1 -i) * mantissa[i];

  // convert the fractional part to decimal
  for (i = n_bits_integral_part; i < N_BITS_MANTISSA; i++)
    result += pow(2, n_bits_integral_part - i - 1) * mantissa[i];
  return result;
}

// shifts the mantissa a number of positions to the right
void shift(char mantissa[], int n_pos)
{
  int i;
  // copy bits n_pos to the right
  for (i = N_BITS_MANTISSA - 1; i >= n_pos; i--)
    mantissa[i] = mantissa[i - n_pos];
  
  // set the front bits of the mantissa to 0
  for (i = n_pos - 1; i >= 0; i--)
    mantissa[i]=0;
    
}

// aligns two numbers in mantissa-exponent representation
// so that they have the same exponent (the larger of the two)
// and returns the exponent
int align(int exp1, char mantissa1[], int exp2, char mantissa2[])
{
  int final_exponent;
  char x1_exponent[N_BITS_EXPONENT], x2_exponent[N_BITS_EXPONENT];

  if (exp1 == exp2)
    final_exponent = exp1; // no changes if same exponent
  else if(exp1 > exp2) // exp1 larger
    {
      shift(mantissa2, exp1 - exp2); // mantissa 2 shifted
      final_exponent = exp1; 
      dec2bin(exp1, x2_exponent); // exponent 2 recomputed
    }
  else // exp2 larger
    {
      shift(mantissa1, exp2 - exp1); // mantissa 1 shifted 
      final_exponent = exp2;
      dec2bin(exp2, x1_exponent); // exponent 1 recomputed
    }
  return final_exponent;
}

//adds two numbers in mantissa-exponent representation
void add(char x1[], char x2[], char result[])
{
  int carry;
  int exponent, exp1, exp2;
  int i;
  char 
    x1_mantissa[N_BITS_MANTISSA],
    x1_exponent[N_BITS_EXPONENT],
    x2_mantissa[N_BITS_MANTISSA],
    x2_exponent[N_BITS_EXPONENT], 
    result_mantissa[N_BITS_MANTISSA], 
    result_exponent[N_BITS_EXPONENT];
  
  // separate bits
  split(x1, x1_mantissa, x1_exponent);
  split(x2, x2_mantissa, x2_exponent);
  
  // convert exponents
  exp1 = bin2dec(x1_exponent);
  exp2 = bin2dec(x2_exponent);

  // align mantissas
  exponent = align(exp1, x1_mantissa, exp2, x2_mantissa);

  // add mantissas bit by bit
  carry = 0;
  for (i = N_BITS_MANTISSA - 1; i >= 0; i--)
    {
      // result is obtained from 3 terms: 
      // the two bits being added plus carry in bit
      char sum = x1_mantissa[i] + x2_mantissa[i] + carry;

      // result has two components: 
      // result bit and carry out bit
      switch(sum)
    {
    case 0: 
        result_mantissa[i] = 0;
        carry = 0;
        break;
    case 1: 
      result_mantissa[i] = 1;
      carry = 0;
      break;
    case 2: 
      result_mantissa[i] = 0;
      carry = 1;
      break;
    case 3: 
      result_mantissa[i] = 1;
      carry = 1;
      break;
    }
    }
  
  // shift if we have a carry from the most significant bit
  if(carry)
    {
      shift(result_mantissa, 1);
      result_mantissa[0] = 1;
      exponent++;
    }

  // convert new exponent
  dec2bin(exponent, result_exponent);
  
  // assemble the result
  gather(result_mantissa, result_exponent, result);
}

int main()
{
  double x1, x2, result;
  char x1_bin[N_BITS], x2_bin[N_BITS], result_bin[N_BITS];
  int i;

  // read numbers
  printf("x1 = ");
  scanf("%lf", &x1);
  printf("x2 = ");
  scanf("%lf", &x2);

  // convert to binary
  convert(x1, x1_bin);
  convert(x2, x2_bin);

  // perform addition
  add(x1_bin,x2_bin, result_bin);
  
  // convert result to decimal
  result = convert_back(result_bin);
  
  // print result
  printf("x1 + x2 = %.20f\n", result);
  return 0;
}
