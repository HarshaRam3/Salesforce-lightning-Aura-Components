public with sharing class getAvgclass{

public boolean show { get; set; }

public decimal result { get; set; }
public decimal text1{get;set;}
public decimal text2{get;set;}
public decimal text3{get;set;}
public decimal text4{get;set;}

public getAvgclass() {
show =false;
}

public PageReference doAvg() {
show =true;
result = ((text1+text2+text3+text4)/4);
return null;
}
}