#final

student_id=( 1 2 3 4 )
user_name=( 101758 101762 101763 101764 )
student_password=( soumya vikas trisha veera )
teacher_id=( 1 2 3 )
teacher_password=( pogba lukaku rahsford )
attendance=( 95 89 92 87 )
cgpi=( 10.0 9.3 9.6 9.2 )

student_name=(Soumya Vikas Trisha Veera)
branch=(Computer EXTC Mechanical IT)
sem=(2 6 2 4)
year_of_joining=(2018 2016 2018 2017)
dob=(2/3/1 27/07/1999 1/2/3 3/4/6 )
#echo ${student_password[*]}
#echo ${teacher_password[*]}
#TOPMARGIN=7
#RIGHTMARGIN=5
#SCREEN_WIDTH=$(xwininfo -root | awk '$1=="Width:" {print $2}')
#SCREEN_HEIGHT=$(xwininfo -root | awk '$1=="Height:" {print $2}')
#W=$(( $SCREEN_WIDTH / 2 - $RIGHTMARGIN ))
#H=$(( $SCREEN_HEIGHT / 2 * $TOPMARGIN ))
#zenity --entry --ok-label=sure 
#--width=$W --height=$H


zenity --info --title="Home" --text="\n\n\nWelcome to Thunderbolt portal "  --height=250 --width=500
#zenity --info --title="Home" --text="Where would you like to go? \n\n 1.Student portal \n\n 2.Teacher Portal"
#zenity --info --text=""
#zenity --info --text=" "
portal_id="$(zenity --entry --title="Home" --entry-text="" --text="Enter the portal id\n\n\n\n 1.Student portal \n\n\n 2.Teacher Portal\n\n"  --width=500  --height=250)"  
#zenity --title="Home" --text="Logging in" --progress --auto-close --auto-kill 2>
#echo "$portal_id"
#read portal_id

student_valid_login() {
	zenity --info --title="Dashboard" --text="\n\n\nWelcome\n\n\n Name = ${student_name[stud_id-1]} \n\n\n Branch = ${branch[stud_id-1]} \n\n\n Semester = ${sem[stud_id-1]} \n\n\n Date of birth = ${dob[stud_id-1]} \n\n\n Year of joining = ${year_of_joining[stud_id-1]}" --width=500  --height=250
	zenity --info --title="Attendance" --text="\n\n\nYour attendance is ${attendance[stud_id-1]}%" --width=500  --height=250
	zenity --info --title="CGPI Score" --text="\n\n\nYour CGPI score is ${cgpi[stud_id-1]}" --width=500  --height=250
}
add_data() {
	resp="$(zenity --entry --title="Update data" --entry-text="" --text="\n\n\nEnter new student id" --width=500  --height=250 )"
	student_id+=( "$resp" )
	resp="$(zenity --entry --title="Update data" --entry-text="" --text="\n\n\nEnter student name" --width=500  --height=250)"
	student_name+=( "$resp" )
	resp="$(zenity --entry --title="Update data" --entry-text="" --text="\n\n\nEnter student branch" --width=500  --height=250)"
	branch+=( "$resp" )
	resp="$(zenity --entry --title="Update data" --entry-text="" --text="\n\n\nEnter student sem" --width=500  --height=250)"
	sem+=( "$resp" )
	resp="$(zenity --entry --title="Update data" --entry-text="" --text="\n\n\nEnter student year of joining" --width=500  --height=250)"
	year_of_joining+=( "$resp" )
	resp="$(zenity --entry --title="Update data" --entry-text="" --text="\n\n\nEnter student dob" --width=500  --height=250)"
	dob+=( "$resp" )
	resp="$(zenity --entry --title="Update data" --entry-text="" --text="\n\n\nEnter student username" --width=500  --height=250)"
	user_name+=( "$resp" )
	resp="$(zenity --entry --title="Update data" --entry-text="" --text="\n\n\nEnter student password"  --width=500  --height=250)"
	student_password+=( "$resp" )
	resp="$(zenity --entry --title="Update data" --entry-text="" --text="\n\n\nEnter student attendance"  --width=500  --height=250)"
	attendance+=( "$resp" )
	resp="$(zenity --entry --title="Update data" --entry-text="" --text="\n\n\nEnter student cgpi"  --width=500  --height=250)"
	cgpi+=( "$resp" )
	
}
update_data() {
	teach_input="$(zenity --entry  --title="Teacher's dashboard" --entry-text="" --text="\n\n\nEnter student id"  --width=500  --height=250)"
	#read teach_input
	flag=1
	for i in 0 1 2 3 4 5
	do
		if [ $teach_input = ${student_id[$i]} ]
		then
			flag=1
			break
		else
			flag=0
		fi
	done

	if [ $flag = 1 ]
	then
		updated_attendance="$(zenity --entry --title="Teacher's dashboard" --entry-text="" --text="\n\n\nEnter student's attendance"  --width=500  --height=250)"
		#read updated_attendance
		attendance[teach_input-1]=$updated_attendance
		updated_cgpi="$(zenity --entry --title="Teacher's dashboard" --entry-text="" --text="\n\n\nEnter student's CGPI"  --width=500  --height=250)"
		#read updated_cgpi
		cgpi[teach_input-1]=$updated_cgpi
		#zenity --info --title="Updated Attendace" --text="attendance = ${attendance[*]}"
		#zenity --info --title="Updated Marks" --text="cgpi = ${cgpi[*]}"
		
		zenity --list --title="Updated Attendace" --width=500  --height=250 --column="Name" --column="Attendace" \
		"${student_name[0]}" "${attendance[0]}" \
		"${student_name[1]}" "${attendance[1]}" \
		"${student_name[2]}" "${attendance[2]}" \
		"${student_name[3]}" "${attendance[3]}" \
		"${student_name[4]}" "${attendance[4]}" \
		"${student_name[5]}" "${attendance[5]}" \
		

		zenity --list --title="Updated Marks"  --width=500  --height=250 --column="Name" --column="CGPI score" \
		"${student_name[0]}" "${cgpi[0]}" \
		"${student_name[1]}" "${cgpi[1]}" \
		"${student_name[2]}" "${cgpi[2]}" \
		"${student_name[3]}" "${cgpi[3]}" \
		"${student_name[4]}" "${cgpi[4]}" \
		"${student_name[5]}" "${cgpi[5]}" \

	else
		zenity --warning --title="Teacher's Dashboard" --width=500  --height=250 --text="\n\n\nYou have entered wrong student id"
		update_data
	fi
}

teacher_valid_login() {
	teach_response="$(zenity --entry --title="Dashboard"  --width=500  --height=250 --entry-text=""  --text="\n\nWhat operation do you wish to perform \n\n\n\n 1.Update student's data \n\n 2.Add new student record")"
	if [ $teach_response = 2 ]
	then
		add_data
	else
		update_data
	fi

}

teacher_portal () {
	zenity --info --title="Teacher's portal"  --width=500  --height=250 --text="\n\n\nWelcome to Teacher portal"
	teach_id="$(zenity --entry --title="Teacher's portal"  --width=500  --height=250 --entry-text="" --text="\n\nEnter teacher id")"
	#read teach_id
	teach_password="$(zenity --password  --width=500  --height=250 --title="Teacher's portal")" #--entry --title="Teacher's portal" --entry-text="" --text="Enter teacher password")"
	#read teach_password
	#teacher login
	if [ ${teacher_password[teach_id-1]} = $teach_password ]
	then
		zenity --info --title="Teacher's portal" --text="\n\n\nValid login"  --width=500  --height=250
		teacher_valid_login
	else
		zenity --warning  --title="Teacher's portal" --text="\n\n\nInavlid login \n\n Please try again"  --width=500  --height=250
		#zenity --info --text=""
		teacher_portal
	fi
	login
}

student_portal() {
	zenity --info --title="Student's portal" --text="\n\n\nWelcome to Student portal"  --width=500  --height=250
	stud_id="$(zenity --entry  --title="Student's portal" --entry-text="" --text="\n\nEnter student id"  --width=500  --height=250)"
	#read stud_id
	stud_username="$(zenity --entry --title="Student's portal"  --entry-text="" --text="\n\nEnter student username"  --width=500  --height=250)"
	#read stud_username
	stud_password="$(zenity --password --title="Student's portal"  --width=500  --height=250)" #--entry --title="Student's portal" --entry-text="" --text="Enter student password")"
	#read stud_password

	#student login	
	if [ ${user_name[stud_id-1]} = $stud_username ]
	then
		if [ ${student_password[stud_id-1]} = $stud_password ]
		then
			zenity --info --title="Student's Portal" --text="\n\n\nValid login"  --width=500  --height=250
			student_valid_login
		else  #invalid password
			zenity --warning --title="Student's portal" --text="\n\nInavlid login \n\n Please try again"  --width=500  --height=250
			#zenity --info --text=""
			student_portal
		fi
	else  #invalid username
		zenity --warning  --title="Student's portal" --text="\n\nInavlid login \n\n Please try again"  --width=500  --height=250
		#zenity --info --text=""
		student_portal
	fi
	login

}

thank_you() {
	zenity --info --text="You have exited"  --width=500  --height=250
	exit
}

login() {
	#zenity --info --title="Home" --width=500  --height=250 --text="\n\n\nWhere would you like to go? \n\n 1.Student portal      2.Teacher Portal     3.Exit"
	#zenity --info --text=""
	portal_id="$(zenity --entry --title="Home" --width=500  --height=250 --entry-text="" --text="\n\nWhere would you like to go? \n\n 1.Student portal      2.Teacher Portal     3.Exit\n\nEnter the portal id")"
	#read portal_id
	if [ $portal_id = 1 ]
	then
		student_portal
	elif [ $portal_id = 2 ]
	then
		teacher_portal
	else
		thank_you
	fi
}

if [ $portal_id = 1 ]
then
	student_portal
elif [ $portal_id = 2 ]
then
	teacher_portal
else
	zenity --warning --text="\n\n\nSorry you have entered wrong portal id"  --width=500  --height=250
fi


exit() {
	echo "Thank You"
}