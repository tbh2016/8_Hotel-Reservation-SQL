DROP DATABASE IF EXISTS HotelReservation;

CREATE DATABASE HotelReservation;

USE HotelReservation;

CREATE TABLE Reservation (
	ReservationID INT NOT NULL auto_increment,
    StartDate DATE NOT NULL, 
    EndDate DATE NOT NULL,
    TotalCost dec NOT NULL,
    customerid int not null,
    taxid int not null,
    promotionid int not null,
    primary key(ReservationID)
);	
CREATE TABLE Customer (
	CustomerID INT NOT NULL auto_increment,
    CustomerName varchar(30) NOT NULL, 
    Phone varchar(30) NOT NULL,
    Email varchar(30) NOT NULL,
    Age int(10) not null,
    primary key(CustomerID)
);	
CREATE TABLE Tax (
	TaxID INT NOT NULL auto_increment,
    TaxRate dec(10,2) not null,
    Location varchar(30),
    primary key(TaxID)
);	
CREATE TABLE Promotion (
	PromotionID INT NOT NULL auto_increment,
    StartDate DATE NOT NULL, 
    EndDate DATE NOT NULL,
    PercentageDiscount dec(10,2) null,
	DollarOffDiscount dec(10,2) null,
    primary key(PromotionID)
);	
alter table reservation
add constraint fk_reservation_customer
foreign key (customerid) references customer(customerid);
alter table reservation
add constraint fk_reservation_tax
foreign key (taxid) references tax(taxid);
alter table reservation
add constraint fk_reservation_promotion
foreign key (promotionid) references promotion(promotionid);



CREATE TABLE AddOns (
	AddOnsID INT NOT NULL auto_increment,
    AddOnPrice dec(10,2) not null,
	AddOnType varchar(30) not null,
    primary key(AddOnsID)
);	
CREATE TABLE CustomerAddons(
	CustomerID int not null,
	AddonID int not null,
    primary key(CustomerID, AddonID)
);
alter table CustomerAddons
add constraint fk_CustomerAddons_Customer
foreign key (CustomerID) references Customer(CustomerID);
alter table CustomerAddons
add constraint fk_CustomerAddons_AddOns
foreign key (AddOnID) references AddOns(AddOnsID);



create table RoomType(
	RoomTypeID int not null auto_increment,
    TypeOfRoom varchar(30) not null,
    Price dec not null,
    primary key(RoomTypeID)
);
create table Room(
	RoomID int not null auto_increment,
    RoomNumber int not null,
    FloorNumber int not null,
    OccupancyLimit int not null,
    RoomTypeID int not null,
    ReservationID int null,
    primary key(RoomID)
);
alter table room
add constraint fk_room_roomtypeid
foreign key (roomtypeid) references roomtype(roomtypeid);
alter table room 
add constraint fk_room_reservationid
foreign key (reservationid) references reservation(reservationid);



create table amenity(
	AmenityID int not null auto_increment,
    Description varchar(30) not null,
    Price dec not null,
    primary key(AmenityID)
);
create table RoomAmenities(
    RoomID int not null,
    AmenityID int not null,
    primary key(roomid, amenityid)
);
alter table roomamenities
add constraint fk_roomamenities_roomid
foreign key (roomid) references room(roomid);
alter table roomamenities
add constraint fk_roomamanities_amenityid
foreign key (amenityid) references amenity(amenityid);




