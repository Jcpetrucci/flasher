#!/bin/bash
clear
stty -echo
case $1 in
wag)
	pattern=(\
	'####            ' \
	'    ####        ' \
	'        ####    ' \
	'            ####' \
	'        ####    ' \
	'    ####        ' \
	);;
right)
	pattern=(\
	'##              ' \
	'  ##            ' \
	'    ##          ' \
	'      ##        ' \
	'        ##      ' \
	'          ##    ' \
	'            ##  ' \
	'              ##' \
	'                ' \
	);;
left)
	pattern=(\
        '              ##' \
        '            ##  ' \
        '          ##    ' \
        '        ##      ' \
        '      ##        ' \
        '    ##          ' \
        '  ##            ' \
        '##              ' \
        '                ' \
	);;
split)
	pattern=(\
	'       ##       ' \
	'      ####      ' \
	'     ##  ##     ' \
	'    ##    ##    ' \
	'   ##      ##   ' \
	'  ##        ##  ' \
	' ##          ## ' \
	'##            ##' \
	);;
pulse)
	pattern=(\
	' ###   ##   ### ' \
	'#   ###  ###   #' \
	);;
pulse2)
	pattern=(\
	'##    ####    ##' \
	'                ' \
	'##    ####    ##' \
	'  ####    ####  ' \
	'                ' \
	'  ####    ####  ' \
	);;
alt*)
	pattern=(\
	'########        ' \
	'                ' \
	'########        ' \
	'        ########' \
	'                ' \
	'        ########' \
	);;
*)
	pattern=(\
	'################' \
	'################' \
	'################' \
	'################' \
	'                ' \
	);;
esac
i=-1
while :; do
	(( i++ ))
	(( i == ${#pattern[@]} )) && i=0
	printf '%s\r' "${pattern[i]}" \
		| sed 's/#/\xE2\x96\xA0/g' # Convert HASHMARK to full block
	sleep .1
done
