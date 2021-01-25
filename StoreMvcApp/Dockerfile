FROM mcr.microsoft.com/dotnet/aspnet:5.0-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0-buster-slim AS build
WORKDIR /src
COPY "StoreMvcApp.csproj" .
RUN dotnet restore "StoreMvcApp.csproj"
COPY . .
RUN dotnet build . -c Release -o /app/build

# RUN apt-get install curl

FROM build AS publish
RUN dotnet publish "StoreMvcApp.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "StoreMvcApp.dll"]