#!/bin/zsh

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
	echo "##################################"
	echo "# c# microservice creator script #"
	echo "##################################"
	echo
	echo "Creates microservice folder/project structure."
	echo "Application Layer (for api), Domain Layer and Infrastructure Layer".
	echo "this also installs base packages generally needed for microservice development (EF core, automapper, etc)"
	echo "in addition to installing packages, references to projects are added as shown-"
	echo "Application => Domain"
	echo "Application => Infrastructure"
	echo "Infrastructure => Domain"
	echo
	echo "Takes two arguments-"
	echo "Argument 1: Project Name"
	echo "Argument 2: Service Name"
	echo 
	exit 1
fi
	
projname=$1
servicename=$2

mkdir $servicename
cd $servicename

# Set up Layers
echo "-Creating layers for .net microservice"
mkdir Application
mkdir Application/"$projname.$servicename.Api"
mkdir Domain
mkdir Domain/"$projname.$servicename.Domain"
mkdir Infrastructure
mkdir Infrastructure/"$projname.$servicename.Persistence"

# Domain Layer
echo "--Setting up domain layer..."
cd Domain/"$projname.$servicename.Domain"
dotnet new classlib 
# folders
echo "---Creating additional folders"
mkdir Abstractions
mkdir Entities
mkdir Args
mkdir Managers

# Infrastructure Layer
echo "--Setting up infrastructure layer..."
cd ../../Infrastructure/"$projname.$servicename.Persistence"
dotnet new classlib 
# packages/references
echo "---Adding packages/references"
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Npgsql.EntityFrameworkCore.PostgreSQL
dotnet add reference ../../Domain/"$projname.$servicename.Domain"/
echo "---Creating additional folders"
# folders
mkdir Respositories
mkdir Contexts

# Application Layer
echo "--Setting up infrastructure layer..."
cd ../../Application/"$projname.$servicename.Api"
dotnet new webapi -controllers 
# packages/references
echo "---Adding packages/references"
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.DependencyInjection
dotnet add package EFCore.NamingConventions
dotnet add package AutoMapper
dotnet add reference ../../Domain/"$projname.$servicename.Domain"/
dotnet add reference ../../Infrastructure/"$projname.$servicename.Persistence"/
# folders
echo "---Creating additional folders"
mkdir Abstractions
mkdir Services

echo "$2 Service Created"
