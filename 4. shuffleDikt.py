import random
import copy


correct = range (1,42)
print correct			#makes a list with 41 indexes
					
templist= copy.copy(correct)		#copy of correct
random.shuffle(templist)		#makes the templist shuffled

index1 = 0

roundlist = copy.copy(templist)

finalFlag = 0

def makeRoundlist():
	global roundlist, templist
	for i in range(len(templist)):
		roundlist[i] = round(templist[i])
	print roundlist


def getNote(bogus=0):		#gives Csound one note in the list at the time (instead of the whole list every time)
	global index1		
	note = roundlist[index1]
	print  "note", note
	index1 += 1
	if index1 >= len(correct):	#makes sure that this function is active all the time, as long as its trigged
		index1 = 0
		fixOrder()
		makeRoundlist()
	return float(note)

def fixOrder():
    global correct, templist
    for i in range(len(correct)):
        distance = correct[i] - templist[i]		#find distance from correct value
        correction = (random.random()*distance*1.1)	#correction algorithm
	templist[i] += correction			#apply correction to shuffled-list			
    print "templist", templist


def likListe(bogus=0):
						# tells Csound if the list is correct or not
   global correct, roundlist, finalFlag
   print correct, roundlist, finalFlag 				
   if correct == roundlist:
	if finalFlag == 41:
		return 1.0
	else:
		finalFlag += 1			# Csound tells the trigger to stop if the value is 1 (cause then the lists are correct)
		return 0.0
   else:
   	return -1.0



# test
if __name__ == '__main__' :
    print correct
    makeRoundlist()
    print roundlist

    for i in range(300):
        fixOrder()
        print templist