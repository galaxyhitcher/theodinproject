l0 = "		"
l1 = "Table of Contents".center 40
l2 = "		"
l3 = "Chapter 1:  Numbers".ljust(20) + "page 1".rjust(20)
l4 = "Chapter 2:  Letters".ljust(20) + "page 72".rjust(20)
l5 = "Chapter 3:  Variables".ljust(20) + "page 118".rjust(19)

table = [l0,l1,l2,l3,l4,l5]

table.each do |str|
  puts str
end