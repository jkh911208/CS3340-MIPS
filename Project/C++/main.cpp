#include <iostream>

using namespace std;

int array_main[6][7]; // main array
// Empty:0, User:1, Computer:2
int last_row, last_col;
int print_array();
int win();
int user_input();
int machine_input();

int main(int argc, const char * argv[]) {
    
    cout<< "Game Start!\n\n";
    print_array();
    while(1) {
        user_input();
        win();
        machine_input();
        win();
    }
    return 0;
}


int print_array() {
    
    cout<<"1 2 3 4 5 6 7\n";
    for(int i=0;i<6;i++) {
        //cout<<i+1<<" ";
        for(int j=0;j<7;j++) {
            if(array_main[i][j]==0) cout<<"- ";
            else if(array_main[i][j]==1) cout<<"U ";
            else if(array_main[i][j]==2) cout<<"C ";
        }
        //cout<<i+1<<" ";
        cout<<'\n';
    }
    cout<<"1 2 3 4 5 6 7\n";
    cout<<"\n";
    return 0;
}

int user_input() {
    int col;
    
    while(1) {
        cout<<"Please input the column by number : ";
        cin>>col;
        if(col>7 || col<1 || array_main[0][col-1]!=0)
            cout<<"Please select different column\n";
        else {
            last_col=col-1;
            break;
        }
        
    }
    for(int i=5;i>=0;i--) {
        if(array_main[i][col-1]==0) {
            array_main[i][col-1]=1;
            last_row=i;
            break;
        }
    }
    cout<<"\n";
    print_array();
    return 0;
}

int machine_input() {
    int col;
    while(1) {
        col = rand() % 7;
        if(array_main[0][col]==0) {
            cout<<"Computer Input : "<<col<<"\n";
            last_col=col;
            break;
        }
    }
    
    for(int i=5;i>=0;i--) {
        if(array_main[i][col]==0) {
            array_main[i][col]=2;
            last_row=i;
            break;
        }
    }
    
    cout<<"\n";
    print_array();
    return 0;
}

int win() {
    
    //horizontal
    for(int j=0;j<4;j++) {
        if(array_main[last_row][j]==0)
            continue;
        else {
            if(array_main[last_row][j]!=array_main[last_row][j+1]) continue;
            if(array_main[last_row][j]!=array_main[last_row][j+2]) continue;
            if(array_main[last_row][j]!=array_main[last_row][j+3]) continue;
            
            if(array_main[last_row][j]==1) {
                cout<<"User Win\n";
                exit(0);
            } else {
                cout<<"Computer Win\n";
                exit(0);
            }
        }
    }
    
    //vertical without loop
    if(last_row<3) {
        if(array_main[last_row][last_col]==array_main[last_row+1][last_col] && array_main[last_row][last_col]==array_main[last_row+2][last_col] && array_main[last_row][last_col]==array_main[last_row+3][last_col]) {
            
            if(array_main[last_row][last_col]==1) {
                cout<<"User Win\n";
                exit(0);
            } else {
                cout<<"Computer Win\n";
                exit(0);
            }
        }
    }
    
    //diagonal_1
    int temp_row=last_row;
    int temp_col=last_col;
    
    while(temp_row>0 && temp_col>0) {
        temp_row--;
        temp_col--;
    }
    
    for(temp_row,temp_col;temp_row<3,temp_col<4;temp_row++,temp_col++) {
        if(array_main[temp_row][temp_col]==0)
            continue;
        else {
            if(array_main[temp_row][temp_col]!=array_main[temp_row+1][temp_col+1]) continue;
            if(array_main[temp_row][temp_col]!=array_main[temp_row+2][temp_col+2]) continue;
            if(array_main[temp_row][temp_col]!=array_main[temp_row+3][temp_col+3]) continue;
            
            if(array_main[temp_row][temp_col]==1) {
                cout<<"User Win\n";
                exit(0);
            } else {
                cout<<"Computer Win\n";
                exit(0);
            }
        }
    }
    
    //diagonal_2
    temp_row=last_row;
    temp_col=last_col;
    
    while(temp_row<5 && temp_col>0) {
        temp_row++;
        temp_col--;
    }
    
    for(temp_row,temp_col;temp_row>3,temp_col<4;temp_row--,temp_col++) {
        if(array_main[temp_row][temp_col]==0)
            continue;
        else {
            if(array_main[temp_row][temp_col]!=array_main[temp_row-1][temp_col+1]) continue;
            if(array_main[temp_row][temp_col]!=array_main[temp_row-2][temp_col+2]) continue;
            if(array_main[temp_row][temp_col]!=array_main[temp_row-3][temp_col+3]) continue;
            
            if(array_main[temp_row][temp_col]==1) {
                cout<<"User Win\n";
                exit(0);
            } else {
                cout<<"Computer Win\n";
                exit(0);
            }
        }
    }
    
    
    //draw
    for(int j=0;j<7;j++) {
        if(array_main[0][j]==0) return 0;
        
        if(j==6) {
            cout<<"Draw\n";
            exit(0);
        }
    }
    return 0;
}
