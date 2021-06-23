

function  verse( number)
{
	 var verso_n =  [ "first",  "second",
					  "third",  "fourth",
					  "fifth",  "sixth",
					  "seventh",  "eighth",  "ninth",
					  "tenth",  "eleventh",
					  "twelfth"];
	 var regalo = ["and a Partridge in a Pear Tree",
				  "two Turtle Doves ",
				  "three French Hens",
				  "four Calling Birds",
				  "five Gold Rings",
				  "six Geese-a-Laying",
				  "seven Swans-a-Swimming",
				  "eight Maids-a-Milking",
				  "nine Ladies Dancing",
				  "ten Lords-a-Leaping",
				  "eleven Pipers Piping",
				  "twelve Drummers Drumming"];
	var resultado;
	var arr = regalo.filter((_, i) => i<=number-1).reverse().join(', ');
	var regalos=''; 
	var resultado =`On the ${verso_n[number-1]} day of Christmas my true love gave to me: ${arr}.`
	return resultado;
}



function rango(inicio, fin )
{
	var resultado='';
	while(inicio <= fin)
	{ 
		 resultado+= verse( inicio)+'\n';	
		 inicio++;
	}
	
	return resultado;
}

console.log(rango(1,12));