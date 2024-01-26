import 'package:expense/datetime/date_time_helper.dart';
import 'package:expense/models/expense-item.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier {

  List<ExpenseItem>overallExpenseList=[];

List<ExpenseItem>getAllExpenseList(){
  return overallExpenseList;
}

void addNewExpense(ExpenseItem newExpense){
  overallExpenseList.add(newExpense);
}


void deleteExpense(ExpenseItem expense){
  overallExpenseList.remove(expense);
}

String getDayName(DateTime dateTime){
  switch(dateTime.weekday){
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    case 7:
      return 'Sunday';
      default:
      return '';
  }
}

DateTime? startOfWeekDate(){
  DateTime? startOfWeek;

  DateTime today = DateTime.now();
  
  for(int i=0;i<7 ;i++){
    if(getDayName(today.subtract(Duration(days:i)))== 'Sunday'){
     
     startOfWeek=today.subtract(Duration(days:i));
    }

  }
  return startOfWeek;

}


Map<String,double>calculateDailyExpenseSummary(){
  Map<String,double>dailyExpenseSummary={

  };

  for(var expense in overallExpenseList){
    String date=convertDateTimeToString(expense.dateTime);
    double amount=expense.amount;

    if(dailyExpenseSummary.containsKey(date)){
      double currentAmount=dailyExpenseSummary[date]!;
      currentAmount+=amount;
      dailyExpenseSummary[date]=currentAmount;
  }
  else{
    dailyExpenseSummary.addAll({date:amount});
  }
}
return dailyExpenseSummary;

}
}