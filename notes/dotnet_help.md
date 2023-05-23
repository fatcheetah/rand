# commands for dotnet projs

## new solution 
dotnet new sln

## new proj types
+ dotnet new mstest -o NAME
+ dotnet new console -o NAME((running bit))
+ dotnet new classlib -o NAME

## ref proj types
+ dotnet sln add FOLDER/$$$.csproj (after new proj added)
+ dotnet add FOLDER/$$$.csproj refrence FOLDER/$$$.csproj (receiever <- csproj to ref) 

## run tests
+ dotnet test FOLDER/$$$.csproj
 
