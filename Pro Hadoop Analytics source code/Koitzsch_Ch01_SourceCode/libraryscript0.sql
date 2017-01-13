
CREATE TABLE IF NOT EXISTS Names(
NameID INT AUTO_INCREMENT NOT NULL,
Salutation VARCHAR(30) NOT NULL,
FirstName VARCHAR(30) NOT NULL,
MiddleName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
AddressID INT DEFAULT 0,
Active ENUM('Y', 'N') DEFAULT 'N',
TypeID INT DEFAULT 0,
CreationDate TIMESTAMP,
LastModified TIMESTAMP,
PRIMARY KEY (NameID));

CREATE TABLE IF NOT EXISTS NameTypes(
NameTypeID INT AUTO_INCREMENT NOT NULL,
NameID INT,
TypeID INT,
Description TEXT,
Active ENUM('Y', 'N') DEFAULT 'N',
CreationDate TIMESTAMP,
LastModified TIMESTAMP,
PRIMARY KEY(NameTypeID));

CREATE TABLE IF NOT EXISTS Citations(
CitationID INT AUTO_INCREMENT NOT NULL,
Document1 INT,
DocumentLocation1 INT,
Document2 INT,
DocumentLocation2 INT,
CitationType INT,
CitationText TEXT,
LastModified TIMESTAMP,
PRIMARY KEY(CitationID));

CREATE TABLE IF NOT EXISTS Series(
SeriesID INT AUTO_INCREMENT NOT NULL,
SeriesName VARCHAR(80),
Description TEXT,
CreationDate TIMESTAMP,
LastModified TIMESTAMP,
InventoryID INT,
ParentSeriesID INT,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(SeriesID));

CREATE TABLE IF NOT EXISTS Domains(
DomainID INT AUTO_INCREMENT NOT NULL,
DomainName VARCHAR(255),
DomainType INT,
Description TEXT,
ParentDomainID INT,
CreationDate TIMESTAMP,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(DomainID));

CREATE TABLE IF NOT EXISTS Topics(
TopicID INT AUTO_INCREMENT NOT NULL,
TopicType INT,
TopicName TEXT,
Description TEXT,
CreationDate TIMESTAMP,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(TopicID));

CREATE TABLE IF NOT EXISTS Persons(
PersonID INT AUTO_INCREMENT NOT NULL,
NameID INT NOT NULL,
TypeID INT,
BioID INT,
URL VARCHAR(255),
Description TEXT,
Active ENUM('Y', 'N') DEFAULT 'N',
Gender ENUM('M', 'F') DEFAULT 'M',
CreationDate TIMESTAMP,
LastModified TIMESTAMP,
PRIMARY KEY(PersonID));

CREATE TABLE IF NOT EXISTS Provenance(
ProvenanceID INT AUTO_INCREMENT NOT NULL,
Description TEXT,
ProvenanceType INT,
CreationDate TIMESTAMP,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(ProvenanceID));

CREATE TABLE IF NOT EXISTS Files(
FileID INT AUTO_INCREMENT NOT NULL,
FileName VARCHAR(80),
FileType INT,
Description TEXT,
CreationDate TIMESTAMP,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(FileID)); 

CREATE TABLE IF NOT EXISTS FileTypes(
FileTypeID INT AUTO_INCREMENT NOT NULL,
Description TEXT,
CreationDate TIMESTAMP,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(FileTypeID)); 

CREATE TABLE IF NOT EXISTS Images(
ImageID INT AUTO_INCREMENT NOT NULL,
ReferenceID INT,
ImageName VARCHAR(80),
ImageFileName VARCHAR(80),
ImageTypeID INT,
FileHistoryID INT,
FileLinkIDSet INT,
MetadataID INT,
CreationDate TIMESTAMP,
LastModified TIMESTAMP,
Description TEXT,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(ImageID));

CREATE TABLE IF NOT EXISTS Authors(
AuthorID INT AUTO_INCREMENT NOT NULL,
PersonID INT,
Active ENUM('Y', 'N') DEFAULT 'N',
TypeID INT DEFAULT 0,
CreationDate TIMESTAMP,
LastModified TIMESTAMP,
PRIMARY KEY(AuthorID));

CREATE TABLE IF NOT EXISTS Editors(
EditorID INT AUTO_INCREMENT NOT NULL,
EditorName TEXT,
PersonID INT,
Active ENUM('Y', 'N') DEFAULT 'N',
TypeID INT DEFAULT 0,
CreationDate TIMESTAMP,
LastModified TIMESTAMP,
PRIMARY KEY(EditorID));

CREATE TABLE IF NOT EXISTS Reviewers(
ReviewerID INT AUTO_INCREMENT NOT NULL,
ReviewerName TEXT,
PersonID INT,
Active ENUM('Y', 'N') DEFAULT 'N',
TypeID INT DEFAULT 0,
LastModified TIMESTAMP,
PRIMARY KEY(ReviewerID));

CREATE TABLE IF NOT EXISTS Publishers(
PublisherID INT AUTO_INCREMENT NOT NULL,
PublisherName TEXT,
LocationID INT,
PersonID1 INT,
PersonID2 INT,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(PublisherID));

CREATE TABLE IF NOT EXISTS AuthorPublishers(
AuthorPublisherID INT AUTO_INCREMENT NOT NULL,
AuthorID INT,
PublisherID INT,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(AuthorPublisherID));

CREATE TABLE IF NOT EXISTS PersonGroups(
PersonGroupID INT AUTO_INCREMENT NOT NULL,
PersonID INT,
GroupID INT,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(PersonGroupID));

CREATE TABLE IF NOT EXISTS DocumentGroups(
DocumentGroupID INT AUTO_INCREMENT NOT NULL,
DocumentID INT,
GroupID INT,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(DocumentGroupID));

CREATE TABLE IF NOT EXISTS Groups(
GroupID INT AUTO_INCREMENT NOT NULL,
Name TEXT,
Description TEXT,
GroupType INT,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(GroupID));

CREATE TABLE IF NOT EXISTS References(
ReferenceID AUTO_INCREMENT NOT NULL,
ReferenceName TEXT,
Description TEXT,
ReferenceType INT,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(ReferenceID));

CREATE TABLE IF NOT EXISTS Indexes(
IndexID INT AUTO_INCREMENT NOT NULL,
ReferenceID INT,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(IndexID));

CREATE TABLE IF NOT EXISTS Addresses(
AddressID INT AUTO_INCREMENT NOT NULL,
Address1 VARCHAR(255),
Address2 VARCHAR(255),
City VARCHAR(50),
State VARCHAR(20),
Country VARCHAR(20),
Email VARCHAR(80),
Email2 VARCHAR(80),
URL VARCHAR(80),
Phone1 VARCHAR(30),
Phone2 VARCHAR(30),
Phone3 VARCHAR(30),
LastModified TIMESTAMP,
URL VARCHAR(255),
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(AddressID));

CREATE TABLE IF NOT EXISTS Catalogs(
CatalogID INT AUTO_INCREMENT NOT NULL,
CatalogName TEXT,
CollectionID INT,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(CatalogID));

CREATE TABLE IF NOT EXISTS Libraries(
LibraryID INT AUTO_INCREMENT NOT NULL,
LibraryName TEXT,
LocationID INT,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(LibraryID));

CREATE TABLE IF NOT EXISTS Booksellers(
BooksellerID INT AUTO_INCREMENT NOT NULL,
BooksellerName TEXT,
LocationID INT,
Description TEXT,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(BooksellerID));

CREATE TABLE IF NOT EXISTS Collections(
CollectionID INT AUTO_INCREMENT NOT NULL,
CollectionName TEXT,
CollectionType INT,
CatalogID INT,
LibraryID INT,
CuratorID INT,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(CollectionID));

CREATE TABLE IF NOT EXISTS Places(
PlaceID INT AUTO_INCREMENT NOT NULL,
CollectionID INT,
Description TEXT,
LastModified TIMESTAMP,
PlaceType INT,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(PlaceID));

CREATE TABLE IF NOT EXISTS Locations(
LocationID INT AUTO_INCREMENT NOT NULL,
PlaceID INT,
ReferenceID INT,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(LocationID));

CREATE TABLE DocumentTypes(
DocumentTypeID INT AUTO_INCREMENT NOT NULL,
DocumentType VARCHAR(8) NOT NULL,
Name VARCHAR(30) NOT NULL,
Description TEXT,
Keywords VARCHAR(255),
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(DocumentTypeID));

CREATE TABLE IF NOT EXISTS LanguageCodes(
LanguageCodeID INT AUTO_INCREMENT NOT NULL,
localeCode VARCHAR(10),
lastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(LanguageCodeID));

CREATE TABLE IF NOT EXISTS Inventories(
InventoryID INT AUTO_INCREMENT NOT NULL,
InventoryName VARCHAR(255),
LocationID INT,
CreationDate TIMESTAMP,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(InventoryID));

CREATE TABLE IF NOT EXISTS DocumentDomains(
DocumentDomainID INT AUTO_INCREMENT NOT NULL,
DocumentID INT,
DomainID INT,
CreationDate TIMESTAMP,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(DocumentDomainID));

CREATE TABLE IF NOT EXISTS Documents(
DocumentID INT AUTO_INCREMENT NOT NULL,
DocumentTypeID INT,
DocumentDomainID INT,
LocationID INT,
ISBN VARCHAR(30),
ISBN10 VARCHAR(30),
ISBN13 VARCHAR(30),
AuthorID INT,
AbstractID INT,
TranslatorID INT,
LanguageCode INT,
LanguageCode2 INT,
RecordNumber VARCHAR(30),
RecordNumber2 VARCHAR(30),
RecordNumber3 VARCHAR(30),
Title TEXT,
Title2 VARCHAR(255),
URL VARCHAR(255),
CanonicalDocumentUID VARCHAR(255),
InternalID VARCHAR(80),
Summary TEXT,
LastModified TIMESTAMP,
AuthorDate TIMESTAMP,
PublicationDate TIMESTAMP,
Alias VARCHAR(255),
Status CHAR(1), 
Description TEXT,
PhysicalDescription TEXT,
CopyrightInfo TEXT,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(DocumentID));

CREATE TABLE IF NOT EXISTS Letters(
LetterID INT AUTO_INCREMENT NOT NULL,
AuthorID INT,
RecipientID INT,
DocumentID INT,
Description TEXT,
LocationID INT,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(LetterID));

CREATE TABLE IF NOT EXISTS Institutions(
InstitutionID INT AUTO_INCREMENT NOT NULL,
InstitutionName VARCHAR(255),
InstitutionType INT,
Description TEXT,
LocationID INT,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(InstitutionID));

CREATE TABLE IF NOT EXISTS Periodicals(
PeriodicalID INT AUTO_INCREMENT NOT NULL,
ISBN VARCHAR(30),
Title VARCHAR(255),
Year VARCHAR(20),
ID1 VARCHAR(20),
ID2 VARCHAR(20),
LocationID INT,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(PeriodicalID));

CREATE TABLE IF NOT EXISTS Manuscripts(
ManuscriptID INT AUTO_INCREMENT NOT NULL,
ISBN VARCHAR(30),
DocumentID INT,
RecordNumber VARCHAR(30),
RecordNumber2 VARCHAR(30),
RecordNumber3 VARCHAR(30),
Description TEXT,
LocationID INT,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(ManuscriptID));

CREATE TABLE IF NOT EXISTS Books(
BookID INT AUTO_INCREMENT NOT NULL,
DocumentID INT,
Description TEXT,
LocationID INT,
LastModified TIMESTAMP,
Active ENUM('Y', 'N') DEFAULT 'N',
PRIMARY KEY(BookID));

CREATE TABLE IF NOT EXISTS Articles(
ArticleID INT AUTO_INCREMENT NOT NULL,
PeriodicalID INT,
DocumentID INT,
Month VARCHAR(20),
Day VARCHAR(20),
Volume VARCHAR(20),
Number VARCHAR(20),
startPage INT,
endPage INT DEFAULT 0,
RecordNumber VARCHAR(30),
RecordNumber2 VARCHAR(30),
RecordNumber3 VARCHAR(30),
Description TEXT,
LastModified TIMESTAMP,
PRIMARY KEY(ArticleID));

CREATE TABLE Abstracts(
AbstractID INT AUTO_INCREMENT NOT NULL,
Text TEXT,
CreationDate TIMESTAMP,
LastModified TIMESTAMP,
AuthorID INT,
DocumentID INT,
ProvenanceID INT,
PRIMARY KEY(AbstractID));

CREATE TABLE IF NOT EXISTS AdminInfo(
AdminInfoID INT AUTO_INCREMENT NOT NULL,
AccessRestrictions TEXT,
PublicationRights TEXT,
ProvenanceID INT,
PreferredCitation TEXT,
DescriptionID INT,
LastModified TIMESTAMP,
CreationDate TIMESTAMP,
PRIMARY KEY(AdminInfoID));

CREATE TABLE IF NOT EXISTS Descriptions(
DescriptionID INT AUTO_INCREMENT NOT NULL,
Title TEXT,
CollectionNumber2 INT,
CollectionID INT,
CreatorID INT,
Extent VARCHAR(255),
RepositoryID INT,
AuthorBioID INT,
ScopeContent TEXT,
Abstract TEXT,
AccessTerms TEXT,
Language VARCHAR(20),
ItemCount INT,
URL VARCHAR(255),
InternalCollectionNumber VARCHAR(50),
AuthorID INT,
InfoEmail1 VARCHAR(50),
InfoEmail2 VARCHAR(50),
InfoPhone1 VARCHAR(50),
InfoPhone2 VARCHAR(50),
ContactID INT,
Copyright TEXT,
MachineReadableInfo TEXT,
LastModified TIMESTAMP,
CreationDate TIMESTAMP,
PRIMARY KEY(DescriptionID));

CREATE TABLE IF NOT EXISTS Containers(
ContainerID INT AUTO_INCREMENT NOT NULL,
BoxNumber VARCHAR(20),
FolderNumber VARCHAR(20),
SeriesID INT,
CollectionID INT,
Title TEXT,
Name VARCHAR(255),
Description TEXT,
Notes TEXT,
LastModified TIMESTAMP,
CreationDate TIMESTAMP,
PRIMARY KEY(ContainerID));

CREATE TABLE IF NOT EXISTS PersonBios(
BioID INT AUTO_INCREMENT NOT NULL,
PersonID INT,
BioText TEXT,
CreationDate TIMESTAMP,
LastModified TIMESTAMP,
BirthDate TIMESTAMP,
DeathDate TIMESTAMP,
PRIMARY KEY(BioID));

CREATE TABLE IF NOT EXISTS Repositories(
RepositoryID INT AUTO_INCREMENT NOT NULL,
LocationID INT,
NOTES TEXT,
Name TEXT,
LastModified TIMESTAMP,
CreationDate TIMESTAMP,
PRIMARY KEY(RepositoryID));

CREATE TABLE IF NOT EXISTS MaterialTypes(
MaterialTypeID INT AUTO_INCREMENT NOT NULL,
Name TEXT,
Description TEXT,
LastModified TIMESTAMP,
CreationDate TIMESTAMP,
PRIMARY KEY(MaterialTypeID));

CREATE TABLE IF NOT EXISTS Materials(
MaterialID INT AUTO_INCREMENT NOT NULL,
MaterialType INT,
Name TEXT,
LastModified TIMESTAMP,
CreationDate TIMESTAMP,
PRIMARY KEY(MaterialID));

CREATE TABLE IF NOT EXISTS Titles(
TitleID INT AUTO_INCREMENT NOT NULL,
Name TEXT,
Type INT,
Description TEXT,
ShortDescription VARCHAR(80),
ReferenceID INT,
LanguageID INT,
LastModified TIMESTAMP,
Notes TEXT,
PRIMARY KEY(TitleID));

CREATE TABLE IF NOT EXISTS ManuscriptTypes(
ManuscriptTypeID INT AUTO_INCREMENT NOT NULL,
Name VARCHAR(80),
Description TEXT,
DomainID INT,
LastModified TIMESTAMP,
CreationDate TIMESTAMP,
PRIMARY KEY(ManuscriptTypeID));

CREATE TABLE IF NOT EXISTS Items(
ItemID INT AUTO_INCREMENT NOT NULL,
SeriesID INT,
Name VARCHAR(255),
Genre VARCHAR(255),
NumberOfPages INT,
Names TEXT,
Identifier TEXT,
LastModified TIMESTAMP,
CreationDate TIMESTAMP,
PRIMARY KEY(ItemID));

CREATE TABLE IF NOT EXISTS Archives(
ArchiveID INT AUTO_INCREMENT NOT NULL,
ArchiveType INT,
Active ENUM('Y', 'N') DEFAULT 'N',
LastModified TIMESTAMP,
CreationDate TIMESTAMP,
PRIMARY KEY(ArchiveID));

CREATE TABLE IF NOT EXISTS ArchiveTypes(
ArchiveTypeID INT AUTO_INCREMENT NOT NULL,
Name TEXT,
Description TEXT,
MediaID INT,
Active ENUM('Y', 'N') DEFAULT 'N',
LastModified TIMESTAMP,
CreationDate TIMESTAMP,
PRIMARY KEY(ArchiveTypeID));

CREATE TABLE IF NOT EXISTS Sources(
SourceID INT AUTO_INCREMENT NOT NULL,
Name VARCHAR(80),
Description TEXT,
Filename VARCHAR(80),
BackupID INT,
SourceType INT,
Active ENUM('Y', 'N') DEFAULT 'N',
LastModified TIMESTAMP,
CreationDate TIMESTAMP,
PRIMARY KEY(SourceID));

CREATE TABLE IF NOT EXISTS SourceTypes(
SourceTypeID INT AUTO_INCREMENT NOT NULL,
Name VARCHAR(80),
Description TEXT,
Active ENUM('Y', 'N') DEFAULT 'N',
LastModified TIMESTAMP,
CreationDate TIMESTAMP,
PRIMARY KEY(SourceTypeID));

CREATE TABLE IF NOT EXISTS Media(
MediaID INT AUTO_INCREMENT NOT NULL,
Label VARCHAR(255),
MediaTypeID INT,
Description TEXT,
Active ENUM('Y', 'N') DEFAULT 'N',
LastModified TIMESTAMP,
CreationDate TIMESTAMP,
PRIMARY KEY(MediaID));

CREATE TABLE IF NOT EXISTS MediaTypes(
MediaTypeID INT AUTO_INCREMENT NOT NULL,
Name VARCHAR(255),
Description TEXT,
Active ENUM('Y', 'N') DEFAULT 'Y',
LastModified TIMESTAMP,
CreationDate TIMESTAMP,
PRIMARY KEY(MediaTypeID));

CREATE TABLE IF NOT EXISTS Encyclopedias(
EncyclopediaID INT AUTO_INCREMENT NOT NULL,
Name VARCHAR(255),
Description TEXT,
Active ENUM('Y', 'N') DEFAULT 'Y',
LastModified TIMESTAMP,
CreationDate TIMESTAMP,
PRIMARY KEY(EncyclopediaID));

