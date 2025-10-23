#!//bin/bash



items=(
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
print_list(){
  echo "current list (${#items[@]}items):"
    for i in "${!items[@]}"; do
    echo "$((i+1)). ${items[$i]}"
    done
}
print_x_item(){
  read -p "which item do you want to print (Your answer must be between 0 and 9: " answer
  echo "Your item is: ${items[$answer]}"
}

add_item(){
  read -p "Enter the item you want to add: " new_item
  items+=("$new_item")
  echo "You added: $new_item"
}

remove_last(){
  echo "Removing the last item: ${items[-1]}"
  unset 'items[-1]'
  sleep 1
  echo "done"
  sleep 1

}

run=1


echo "welcome to OSASOGIE'S array customizer!"
while [[ $run -eq 1 ]]; do
    echo "what would you like to do?"
    echo "1. print the whole list"
    echo "2. pick an item from the list."
    echo "3. add item to the list"
    echo "4. Remove last item from list"
    echo "5. exit"
    read -p "what is your choice?" choice
    if [ $choice -eq 1 ]; then
      print_list
    elif [ $choice -eq 2 ]; then
      print_x_item
    elif [ $choice -eq 3 ]; then
      add_item
    elif [ $choice -eq 4 ]; then
      remove_last
    elif [ $choice -eq 5 ]; then
      echo "exiting..."
      sleep 2

      exit
    else
      echo "invalid"
    fi
done