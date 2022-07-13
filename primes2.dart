/*
 * program that finds prime numbers
*/

import 'dart:math';
import 'dart:io';

void main() {
        print("");
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        print(" This program finds prime numbers ");
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        print("");

        print("Enter max number to search to:");

        // variable maxn is the maximum number that the program with search primes (starts at 2)
        int? maxn = int.tryParse(stdin.readLineSync()!);

        // check to see if input, attempt to make it into integer, else exit
        if(maxn == null) {
                print("Bad input");
                print('Press <Enter> to end program');
                String? _ = stdin.readLineSync()!;
                return;
        }

        // check if maxn is sane
        if(maxn <= 1) {
                print("Bad input");
                print('Press <Enter> to end program');
                String? _ = stdin.readLineSync()!;
                return;
        }

        print("The primes:");

        // find primes
        bool flag = false;
        for(int n = 2; n < maxn; n++) {
                flag = true;
                int sqrtn = int.parse((sqrt(n)+1).toString().split('.')[0]);
                for(int p = 2; p < sqrtn; p++) {
                        if(n % p == 0) {
                                flag = false;
                                break;
                        }
                }
                if(flag) {
                        print(n);
                }
        }

        print("Press <Enter> to end program");
        String? _ = stdin.readLineSync()!;
}
