#!/bin/bash 

random_array=( 
  "Keyboard"
  "Television"
  "Sled"
  "Bagel"
  "Eraser"
  "Cotton candy "
  "China cabinet"
  "Casserole dish"
  "Trident"
  "bag"
)


Print_array() {
    for item in "${random_array[@]}"; do
        echo "$item"
    done
    sleep 1
}

print_single_word() {
    echo "enter the index of the object you want to print."
    read -p "tip: The first element on the list is counted as 0." index
    #this line means if the user put a number that is 0 or higher, and smaller than the number of items in the array, then do the following 
    if [ "$index" -ge 0 ] && [ "$index" -lt "${#random_array[@]}" ]; then
        echo "You chose: ${random_array[$index]}"
    else
        echo "invalid"
    fi
    sleep 1
}

add_item() {
    read -p "what word do you want to add" word
    read -p "where do you want to add the item in the array?" pos
    #checks if index number user gave is in the array
    if [ "$pos" -ge 0 ] && [ "$pos" -le "${#random_array[@]}" ]; then
        # Splits the array to add the word 
        random_array=("${random_array[@]:0:$pos}" "$word" "${random_array[@]:$pos}")
        echo "Array after insertion: ${random_array[@]}"
    else
        echo "Invalid position."
    fi
}

delete_item() {
    echo "enter the index of the word you want to delete"
    read -p "tip: The first word of array starts with an index of 0 " delete
    if [ "$delete" -ge 0 ] && [ "$delete" -lt "${#random_array[@]}" ]; then
        unset 'random_array[delete]'
        random_array=("${random_array[@]}")
        echo "Array after deletion : ${random_array[@]}"
    else
        echo "invalid index"
    fi
}

save_array() {
    read -p "what would you like to name the file?" new_file
    printf "%s\n" "${random_array[@]}" > "data/${new_file}.txt"
    echo "saved as $new_file.txt"
    sleep 1
}

load_array() {
    read -p "Which file would you like to view? " file_to_view
    if [[ -f "data/${file_to_view}.txt" ]]; then
        echo "Contents of ${file_to_view}:"
        cat "data/${file_to_view}.txt"
        sleep 2
    else
        echo "File not found!"
    fi
}

List_saved_arrays() {
    echo "arrays:"
    if compgen -G "data/*.txt" > /dev/null; then
        ls data/*.txt | xargs -n 1 basename
        sleep 1
    else
        echo "No saved arrays found."
        sleep 1
    fi
}

Delete_box() {
    read -p "Which file would you like to delete? " file_to_delete
    if [[ -f "data/${file_to_delete}.txt" ]]; then
        rm "data/${file_to_delete}.txt"
        echo "${file_to_delete}.txt deleted."
        sleep 1
    else
        echo "File not found!"
        sleep 1
    fi
}




echo "Welcome to saso's array customizer!"
sleep 1 

exiting(){
   read -p "would you like to save before exiting? (y/n):" exit_read
   case $exit_read in
        "y" | "Y") 
             save_array
            echo "done!"
            echo "exiting..."
            sleep 1
            exit   
                ;;
       "n" | "n")
                echo "exiting..."
                sleep 1
                exit   
                    ;;

        *)
            ;;
    esac 
}

check_user_input(){
    case $choice in
        1) Print_array
            ;;
        2) print_single_word
            ;;
        3) add_item
            ;;
        4) delete_item
            ;;
        5) save_array
            ;;
        6) load_array
            ;;
        7) List_saved_arrays
            ;;
        8) Delete_box
            ;;
        9) exiting
            ;;
        *)
            ;;
    esac
}


Display_main_menu(){
    echo -e "
    | Main Menu
    |-----------
    |1. list all the words
    |2. print out a word of your liking
    |3. add an element to the array
    |4. remove an element from the array
    |5. save your array
    |6. load your array
    |7. list your saved arrays
    |8. delete your saved array
    |9. exit"
    read -p "what is your choice: " choice
}

Display_main_menu
check_user_input

