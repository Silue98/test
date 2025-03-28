generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "mysql"
  url      = env("DATABASE_URL")
}

model absencepresence {
  Id_absencepresence Int       @id
  dateappel          DateTime? @db.Date
  statutappel        String?   @db.VarChar(10)
}

model activity_log {
  id           BigInt    @id @default(autoincrement()) @db.UnsignedBigInt
  log_name     String?   @db.VarChar(255)
  description  String    @db.Text
  subject_type String?   @db.VarChar(255)
  event        String?   @db.VarChar(255)
  subject_id   BigInt?   @db.UnsignedBigInt
  causer_type  String?   @db.VarChar(255)
  causer_id    BigInt?   @db.UnsignedBigInt
  properties   Json?
  batch_uuid   String?   @db.Char(36)
  created_at   DateTime? @db.Timestamp(0)
  updated_at   DateTime? @db.Timestamp(0)

  @@index([log_name], map: "activity_log_log_name_index")
  @@index([causer_type, causer_id], map: "causer")
  @@index([subject_type, subject_id], map: "subject")
}

model actualities {
  id                                    BigInt    @id @default(autoincrement()) @db.UnsignedBigInt
  code                                  String?   @unique(map: "actualities_code_unique") @db.VarChar(255)
  rank                                  String?   @db.VarChar(255)
  slug                                  String?   @unique(map: "actualities_slug_unique") @db.VarChar(255)
  lang                                  String?   @db.VarChar(255)
  status                                Boolean?
  user_created                          BigInt?   @db.UnsignedBigInt
  user_updated                          BigInt?   @db.UnsignedBigInt
  title                                 String?   @db.VarChar(255)
  subtitle                              String?   @db.VarChar(255)
  icon                                  String?   @db.VarChar(255)
  content                               String?   @db.LongText
  created_at                            DateTime? @db.Timestamp(0)
  updated_at                            DateTime? @db.Timestamp(0)
  deleted_at                            DateTime? @db.Timestamp(0)
  users_actualities_user_createdTousers users?    @relation("actualities_user_createdTousers", fields: [user_created], references: [id], map: "actualities_user_created_foreign")
  users_actualities_user_updatedTousers users?    @relation("actualities_user_updatedTousers", fields: [user_updated], references: [id], map: "actualities_user_updated_foreign")

  @@index([user_created], map: "actualities_user_created_foreign")
  @@index([user_updated], map: "actualities_user_updated_foreign")
}

model cities {
  id                               BigInt    @id @default(autoincrement()) @db.UnsignedBigInt
  name                             String    @db.VarChar(255)
  country_id                       BigInt    @db.UnsignedBigInt
  created_at                       DateTime? @db.Timestamp(0)
  updated_at                       DateTime? @db.Timestamp(0)
  user_created                     BigInt?   @db.UnsignedBigInt
  user_updated                     BigInt?   @db.UnsignedBigInt
  deleted_at                       DateTime? @db.Timestamp(0)
  countries                        countries @relation(fields: [country_id], references: [id], onDelete: NoAction, onUpdate: NoAction, map: "cities_country_id_foreign")
  users_cities_user_createdTousers users?    @relation("cities_user_createdTousers", fields: [user_created], references: [id], map: "cities_user_created_foreign")
  users_cities_user_updatedTousers users?    @relation("cities_user_updatedTousers", fields: [user_updated], references: [id], map: "cities_user_updated_foreign")

  @@index([country_id], map: "cities_country_id_foreign")
  @@index([user_created], map: "cities_user_created_foreign")
  @@index([user_updated], map: "cities_user_updated_foreign")
}

model classe {
  Id_classe     Int     @id @default(autoincrement())
  nomclass      String? @db.VarChar(50)
  delclass      String? @db.VarChar(50)
  moniprincipal String? @db.VarChar(50)
}

model classes {
  id                                BigInt         @id @default(autoincrement()) @db.UnsignedBigInt
  code                              String?        @unique(map: "classes_code_unique") @db.VarChar(255)
  rank                              String?        @db.VarChar(255)
  slug                              String?        @unique(map: "classes_slug_unique") @db.VarChar(255)
  lang                              String?        @db.VarChar(255)
  user_created                      BigInt?        @db.UnsignedBigInt
  user_updated                      BigInt?        @db.UnsignedBigInt
  title                             String?        @db.VarChar(255)
  description                       String?        @db.VarChar(255)
  created_at                        DateTime?      @db.Timestamp(0)
  updated_at                        DateTime?      @db.Timestamp(0)
  deleted_at                        DateTime?      @db.Timestamp(0)
  users_classes_user_createdTousers users?         @relation("classes_user_createdTousers", fields: [user_created], references: [id], map: "classes_user_created_foreign")
  users_classes_user_updatedTousers users?         @relation("classes_user_updatedTousers", fields: [user_updated], references: [id], map: "classes_user_updated_foreign")
  inscriptions                      inscriptions[]

  @@index([user_created], map: "classes_user_created_foreign")
  @@index([user_updated], map: "classes_user_updated_foreign")
}

model contacts {
  id                                 BigInt    @id @default(autoincrement()) @db.UnsignedBigInt
  code                               String?   @unique(map: "contacts_code_unique") @db.VarChar(255)
  rank                               String?   @db.VarChar(255)
  slug                               String?   @unique(map: "contacts_slug_unique") @db.VarChar(255)
  lang                               String?   @db.VarChar(255)
  user_created                       BigInt?   @db.UnsignedBigInt
  user_updated                       BigInt?   @db.UnsignedBigInt
  user_id                            BigInt?   @db.UnsignedBigInt
  name                               String?   @db.VarChar(255)
  email                              String?   @db.VarChar(255)
  phone                              String?   @db.VarChar(255)
  subject                            String?   @db.VarChar(255)
  message                            String?   @db.Text
  created_at                         DateTime? @db.Timestamp(0)
  updated_at                         DateTime? @db.Timestamp(0)
  deleted_at                         DateTime? @db.Timestamp(0)
  users_contacts_user_createdTousers users?    @relation("contacts_user_createdTousers", fields: [user_created], references: [id], map: "contacts_user_created_foreign")
  users_contacts_user_idTousers      users?    @relation("contacts_user_idTousers", fields: [user_id], references: [id], map: "contacts_user_id_foreign")
  users_contacts_user_updatedTousers users?    @relation("contacts_user_updatedTousers", fields: [user_updated], references: [id], map: "contacts_user_updated_foreign")

  @@index([user_created], map: "contacts_user_created_foreign")
  @@index([user_id], map: "contacts_user_id_foreign")
  @@index([user_updated], map: "contacts_user_updated_foreign")
}

model countries {
  id                                  BigInt    @id @default(autoincrement()) @db.UnsignedBigInt
  code                                String?   @unique(map: "countries_code_unique") @db.VarChar(255)
  rank                                String?   @db.VarChar(255)
  slug                                String?   @unique(map: "countries_slug_unique") @db.VarChar(255)
  status                              Boolean?
  user_created                        BigInt?   @db.UnsignedBigInt
  user_updated                        BigInt?   @db.UnsignedBigInt
  title                               String?   @db.VarChar(255)
  subtitle                            String?   @db.VarChar(255)
  location                            Json?
  icon                                String?   @db.VarChar(255)
  content                             String?   @db.LongText
  created_at                          DateTime? @db.Timestamp(0)
  updated_at                          DateTime? @db.Timestamp(0)
  deleted_at                          DateTime? @db.Timestamp(0)
  cities                              cities[]
  users_countries_user_createdTousers users?    @relation("countries_user_createdTousers", fields: [user_created], references: [id], map: "countries_user_created_foreign")
  users_countries_user_updatedTousers users?    @relation("countries_user_updatedTousers", fields: [user_updated], references: [id], map: "countries_user_updated_foreign")

  @@index([user_created], map: "countries_user_created_foreign")
  @@index([user_updated], map: "countries_user_updated_foreign")
}

model enfant {
  Id_Enfant           Int       @id @default(autoincrement())
  nomenfant           String?   @db.VarChar(50)
  prenomenfant        String?   @db.VarChar(50)
  genre               String?   @db.VarChar(10)
  habitationenfant    String?   @db.VarChar(50)
  lieuhabitation      String?   @db.VarChar(50)
  numerotelephone     String?   @db.VarChar(50)
  emailenfant         String?   @db.VarChar(50)
  datenaissance       DateTime? @db.Date
  lieunaissanceenfant String?   @db.VarChar(50)
  club                String?   @db.VarChar(50)
  dateentreed         DateTime? @db.Date
  orphelinpas         String?   @db.VarChar(50)
  pere_mere           String?   @db.VarChar(50)
  Id_Mere             Int
  Id_Pere             Int

  @@index([Id_Mere], map: "Id_Mere")
  @@index([Id_Pere], map: "Id_Pere")
  @@index([Id_classe], map: "Id_classe")  // Index sur Id_classe

}

model failed_jobs {
  id         BigInt   @id @default(autoincrement()) @db.UnsignedBigInt
  uuid       String   @unique(map: "failed_jobs_uuid_unique") @db.VarChar(255)
  connection String   @db.Text
  queue      String   @db.Text
  payload    String   @db.LongText
  exception  String   @db.LongText
  failed_at  DateTime @default(now()) @db.Timestamp(0)
}

model incription {
  Id_Incription Int     @id
  nomenfant     String? @db.VarChar(50)
  prenomenfant  String? @db.VarChar(50)
  classe        String? @db.VarChar(50)
  Id_classe     Int     
  Id_Enfant     Int     @unique(map: "Id_Enfant")
  dateinscription DateTime

  @@index([Id_classe], map: "Id_classe")
}

model inscriptions {
  id                                     BigInt      @id @default(autoincrement()) @db.UnsignedBigInt
  code                                   String?     @unique(map: "inscriptions_code_unique") @db.VarChar(255)
  rank                                   String?     @db.VarChar(255)
  slug                                   String?     @unique(map: "inscriptions_slug_unique") @db.VarChar(255)
  lang                                   String?     @db.VarChar(255)
  user_created                           BigInt?     @db.UnsignedBigInt
  user_updated                           BigInt?     @db.UnsignedBigInt
  classe_id                              BigInt?     @db.UnsignedBigInt
  student_id                             BigInt?     @db.UnsignedBigInt
  content                                String?     @db.VarChar(255)
  created_at                             DateTime?   @db.Timestamp(0)
  updated_at                             DateTime?   @db.Timestamp(0)
  deleted_at                             DateTime?   @db.Timestamp(0)
  montant                                Float?
  total_paiement                         Float?
  classes                                classes?    @relation(fields: [classe_id], references: [id], map: "inscriptions_classe_id_foreign")
  students                               students?   @relation(fields: [student_id], references: [id], map: "inscriptions_student_id_foreign")
  users_inscriptions_user_createdTousers users?      @relation("inscriptions_user_createdTousers", fields: [user_created], references: [id], map: "inscriptions_user_created_foreign")
  users_inscriptions_user_updatedTousers users?      @relation("inscriptions_user_updatedTousers", fields: [user_updated], references: [id], map: "inscriptions_user_updated_foreign")
  paiements                              paiements[]

  @@index([classe_id], map: "inscriptions_classe_id_foreign")
  @@index([student_id], map: "inscriptions_student_id_foreign")
  @@index([user_created], map: "inscriptions_user_created_foreign")
  @@index([user_updated], map: "inscriptions_user_updated_foreign")
}

model media {
  id                    BigInt    @id @default(autoincrement()) @db.UnsignedBigInt
  model_type            String    @db.VarChar(255)
  model_id              BigInt    @db.UnsignedBigInt
  uuid                  String?   @unique(map: "media_uuid_unique") @db.Char(36)
  collection_name       String    @db.VarChar(255)
  name                  String    @db.VarChar(255)
  file_name             String    @db.VarChar(255)
  mime_type             String?   @db.VarChar(255)
  disk                  String    @db.VarChar(255)
  conversions_disk      String?   @db.VarChar(255)
  size                  BigInt    @db.UnsignedBigInt
  manipulations         Json
  custom_properties     Json
  generated_conversions Json
  responsive_images     Json
  order_column          Int?      @db.UnsignedInt
  created_at            DateTime? @db.Timestamp(0)
  updated_at            DateTime? @db.Timestamp(0)

  @@index([model_type, model_id], map: "media_model_type_model_id_index")
  @@index([order_column], map: "media_order_column_index")
}

model mere {
  Id_Mere            Int     @id @default(autoincrement())
  nommere            String? @db.VarChar(50)
  prenommere         String? @db.VarChar(50)
  lieuhabitationmere String? @db.VarChar(50)
  numeromere         String? @db.VarChar(50)
  emailmere          String? @db.VarChar(50)
  professionmere     String? @db.VarChar(50)
  religionmere       String? @db.VarChar(50)
  eglisemere         String? @db.VarChar(50)
}

model migrations {
  id        Int    @id @default(autoincrement()) @db.UnsignedInt
  migration String @db.VarChar(255)
  batch     Int
}

model model_has_permissions {
  permission_id BigInt      @db.UnsignedBigInt
  model_type    String      @db.VarChar(255)
  model_id      BigInt      @db.UnsignedBigInt
  permissions   permissions @relation(fields: [permission_id], references: [id], onDelete: Cascade, onUpdate: NoAction, map: "model_has_permissions_permission_id_foreign")

  @@id([permission_id, model_id, model_type])
  @@index([model_id, model_type], map: "model_has_permissions_model_id_model_type_index")
}

model model_has_roles {
  role_id    BigInt @db.UnsignedBigInt
  model_type String @db.VarChar(255)
  model_id   BigInt @db.UnsignedBigInt
  roles      roles  @relation(fields: [role_id], references: [id], onDelete: Cascade, onUpdate: NoAction, map: "model_has_roles_role_id_foreign")

  @@id([role_id, model_id, model_type])
  @@index([model_id, model_type], map: "model_has_roles_model_id_model_type_index")
}

model paiements {
  id                                  BigInt        @id @default(autoincrement()) @db.UnsignedBigInt
  code                                String?       @unique(map: "paiements_code_unique") @db.VarChar(255)
  rank                                String?       @db.VarChar(255)
  slug                                String?       @unique(map: "paiements_slug_unique") @db.VarChar(255)
  lang                                String?       @db.VarChar(255)
  user_created                        BigInt?       @db.UnsignedBigInt
  user_updated                        BigInt?       @db.UnsignedBigInt
  inscription_id                      BigInt?       @db.UnsignedBigInt
  moy_paie                            String?       @db.VarChar(255)
  montant                             String?       @db.VarChar(255)
  total_paiement                      String?       @db.VarChar(255)
  description                         String?       @db.VarChar(255)
  created_at                          DateTime?     @db.Timestamp(0)
  updated_at                          DateTime?     @db.Timestamp(0)
  deleted_at                          DateTime?     @db.Timestamp(0)
  inscriptions                        inscriptions? @relation(fields: [inscription_id], references: [id], map: "paiements_inscription_id_foreign")
  users_paiements_user_createdTousers users?        @relation("paiements_user_createdTousers", fields: [user_created], references: [id], map: "paiements_user_created_foreign")
  users_paiements_user_updatedTousers users?        @relation("paiements_user_updatedTousers", fields: [user_updated], references: [id], map: "paiements_user_updated_foreign")

  @@index([inscription_id], map: "paiements_inscription_id_foreign")
  @@index([user_created], map: "paiements_user_created_foreign")
  @@index([user_updated], map: "paiements_user_updated_foreign")
}

model password_reset_tokens {
  email      String    @id @db.VarChar(255)
  token      String    @db.VarChar(255)
  created_at DateTime? @db.Timestamp(0)
}

model payement {
  Id_Payement           Int      @id @default(autoincrement())
  montant               Decimal? @db.Decimal(15, 2)
  moyenpayement         String?  @db.VarChar(50)
  totatpayement         Decimal? @db.Decimal(15, 2)
  reponsablefinancement String?  @db.VarChar(50)
  statutpayement        String?  @db.VarChar(10)
  Id_Incription         Int

  @@index([Id_Incription], map: "Id_Incription")
}

model pere {
  Id_Pere         Int     @id @default(autoincrement())
  email           String? @db.VarChar(50)
  profession      String? @db.VarChar(50)
  nompere         String? @db.VarChar(50)
  prenompere      String? @db.VarChar(50)
  lieuhabitation  String? @db.VarChar(50)
  numerotelephone String? @db.VarChar(50)
  religionpere    String? @db.VarChar(50)
  eglisepere      String? @db.VarChar(50)
}

model permissions {
  id                    BigInt                  @id @default(autoincrement()) @db.UnsignedBigInt
  name                  String                  @db.VarChar(255)
  guard_name            String                  @db.VarChar(255)
  created_at            DateTime?               @db.Timestamp(0)
  updated_at            DateTime?               @db.Timestamp(0)
  model_has_permissions model_has_permissions[]
  role_has_permissions  role_has_permissions[]

  @@unique([name, guard_name], map: "permissions_name_guard_name_unique")
}

model personal_access_tokens {
  id             BigInt    @id @default(autoincrement()) @db.UnsignedBigInt
  tokenable_type String    @db.VarChar(255)
  tokenable_id   BigInt    @db.UnsignedBigInt
  name           String    @db.VarChar(255)
  token          String    @unique(map: "personal_access_tokens_token_unique") @db.VarChar(64)
  abilities      String?   @db.Text
  last_used_at   DateTime? @db.Timestamp(0)
  expires_at     DateTime? @db.Timestamp(0)
  created_at     DateTime? @db.Timestamp(0)
  updated_at     DateTime? @db.Timestamp(0)

  @@index([tokenable_type, tokenable_id], map: "personal_access_tokens_tokenable_type_tokenable_id_index")
}

model presence {
  Id_Incription      Int @default(autoincrement())
  Id_absencepresence Int

  @@id([Id_Incription, Id_absencepresence])
  @@index([Id_absencepresence], map: "Id_absencepresence")
}

model role_has_permissions {
  permission_id BigInt      @db.UnsignedBigInt
  role_id       BigInt      @db.UnsignedBigInt
  permissions   permissions @relation(fields: [permission_id], references: [id], onDelete: Cascade, onUpdate: NoAction, map: "role_has_permissions_permission_id_foreign")
  roles         roles       @relation(fields: [role_id], references: [id], onDelete: Cascade, onUpdate: NoAction, map: "role_has_permissions_role_id_foreign")

  @@id([permission_id, role_id])
  @@index([role_id], map: "role_has_permissions_role_id_foreign")
}

model roles {
  id                   BigInt                 @id @default(autoincrement()) @db.UnsignedBigInt
  name                 String                 @db.VarChar(255)
  guard_name           String                 @db.VarChar(255)
  created_at           DateTime?              @db.Timestamp(0)
  updated_at           DateTime?              @db.Timestamp(0)
  model_has_roles      model_has_roles[]
  role_has_permissions role_has_permissions[]

  @@unique([name, guard_name], map: "roles_name_guard_name_unique")
}

model sessions {
  id            String  @id @db.VarChar(255)
  user_id       BigInt? @db.UnsignedBigInt
  ip_address    String? @db.VarChar(45)
  user_agent    String? @db.Text
  payload       String  @db.LongText
  last_activity Int

  @@index([last_activity], map: "sessions_last_activity_index")
  @@index([user_id], map: "sessions_user_id_index")
}

model students {
  id                                 BigInt         @id @default(autoincrement()) @db.UnsignedBigInt
  code                               String?        @unique(map: "students_code_unique") @db.VarChar(255)
  rank                               String?        @db.VarChar(255)
  slug                               String?        @unique(map: "students_slug_unique") @db.VarChar(255)
  lang                               String?        @db.VarChar(255)
  email                              String?        @unique(map: "students_email_unique") @db.VarChar(255)
  email_verified_at                  DateTime?      @db.Timestamp(0)
  password                           String?        @db.VarChar(255)
  remember_token                     String?        @db.VarChar(100)
  status                             Boolean?
  orphelin                           String?        @db.VarChar(255)
  orph                               String?        @db.VarChar(255)
  checked_at                         DateTime?      @db.Timestamp(0)
  user_created                       BigInt?        @db.UnsignedBigInt
  user_updated                       BigInt?        @db.UnsignedBigInt
  last_name                          String?        @db.VarChar(255)
  first_name                         String?        @db.VarChar(255)
  sex                                students_sex?
  birth_at                           DateTime?      @db.Timestamp(0)
  birth_place                        String?        @db.VarChar(255)
  content                            String?        @db.VarChar(255)
  activity_group                     String?        @db.VarChar(255)
  phone                              String?        @db.VarChar(255)
  address                            String?        @db.VarChar(255)
  habita                             String?        @db.VarChar(255)
  date_enter                         DateTime?      @db.Timestamp(0)
  job_parent                         String?        @db.VarChar(255)
  type_parent                        String?        @db.VarChar(255)
  parent_id                          BigInt?        @db.UnsignedBigInt
  religion                           String?        @db.VarChar(255)
  church                             String?        @db.VarChar(255)
  location                           Json?
  desc                               String?        @db.VarChar(255)
  bio                                String?        @db.LongText
  other                              Json?
  country_id                         BigInt?        @db.UnsignedBigInt
  created_at                         DateTime?      @db.Timestamp(0)
  updated_at                         DateTime?      @db.Timestamp(0)
  deleted_at                         DateTime?      @db.Timestamp(0)
  all_name                           String?        @db.VarChar(255)
  inscriptions                       inscriptions[]
  students                           students?      @relation("studentsTostudents", fields: [parent_id], references: [id], map: "students_parent_id_foreign")
  other_students                     students[]     @relation("studentsTostudents")
  users_students_user_createdTousers users?         @relation("students_user_createdTousers", fields: [user_created], references: [id], map: "students_user_created_foreign")
  users_students_user_updatedTousers users?         @relation("students_user_updatedTousers", fields: [user_updated], references: [id], map: "students_user_updated_foreign")

  @@index([parent_id], map: "students_parent_id_foreign")
  @@index([user_created], map: "students_user_created_foreign")
  @@index([user_updated], map: "students_user_updated_foreign")
}

model users {
  id                                            BigInt         @id @default(autoincrement()) @db.UnsignedBigInt
  code                                          String?        @unique(map: "users_code_unique") @db.VarChar(255)
  rank                                          String?        @db.VarChar(255)
  slug                                          String?        @unique(map: "users_slug_unique") @db.VarChar(255)
  lang                                          String?        @db.VarChar(255)
  email_verified_at                             DateTime?      @db.Timestamp(0)
  remember_token                                String?        @db.VarChar(100)
  status                                        Boolean?
  checked_at                                    DateTime?      @db.Timestamp(0)
  user_created                                  BigInt?        @db.UnsignedBigInt
  user_updated                                  BigInt?        @db.UnsignedBigInt
  last_name                                     String?        @db.VarChar(255)
  first_name                                    String?        @db.VarChar(255)
  email                                         String?        @unique(map: "users_email_unique") @db.VarChar(255)
  password                                      String?        @db.VarChar(255)
  two_factor_secret                             String?        @db.Text
  two_factor_recovery_codes                     String?        @db.Text
  two_factor_confirmed_at                       DateTime?      @db.Timestamp(0)
  pseudo                                        String?        @unique(map: "users_pseudo_unique") @db.VarChar(255)
  phone                                         String?        @db.VarChar(255)
  address                                       String?        @db.VarChar(255)
  location                                      Json?
  occupation                                    String?        @db.VarChar(255)
  level                                         String?        @db.VarChar(255)
  sex                                           users_sex?
  birth_at                                      DateTime?      @db.Timestamp(0)
  birth_place                                   String?        @db.VarChar(255)
  marital                                       Boolean?
  child                                         Float?
  bio                                           String?        @db.LongText
  other                                         Json?
  country_id                                    BigInt?        @db.UnsignedBigInt
  parent_id                                     BigInt?        @db.UnsignedBigInt
  created_at                                    DateTime?      @db.Timestamp(0)
  updated_at                                    DateTime?      @db.Timestamp(0)
  deleted_at                                    DateTime?      @db.Timestamp(0)
  actualities_actualities_user_createdTousers   actualities[]  @relation("actualities_user_createdTousers")
  actualities_actualities_user_updatedTousers   actualities[]  @relation("actualities_user_updatedTousers")
  cities_cities_user_createdTousers             cities[]       @relation("cities_user_createdTousers")
  cities_cities_user_updatedTousers             cities[]       @relation("cities_user_updatedTousers")
  classes_classes_user_createdTousers           classes[]      @relation("classes_user_createdTousers")
  classes_classes_user_updatedTousers           classes[]      @relation("classes_user_updatedTousers")
  contacts_contacts_user_createdTousers         contacts[]     @relation("contacts_user_createdTousers")
  contacts_contacts_user_idTousers              contacts[]     @relation("contacts_user_idTousers")
  contacts_contacts_user_updatedTousers         contacts[]     @relation("contacts_user_updatedTousers")
  countries_countries_user_createdTousers       countries[]    @relation("countries_user_createdTousers")
  countries_countries_user_updatedTousers       countries[]    @relation("countries_user_updatedTousers")
  inscriptions_inscriptions_user_createdTousers inscriptions[] @relation("inscriptions_user_createdTousers")
  inscriptions_inscriptions_user_updatedTousers inscriptions[] @relation("inscriptions_user_updatedTousers")
  paiements_paiements_user_createdTousers       paiements[]    @relation("paiements_user_createdTousers")
  paiements_paiements_user_updatedTousers       paiements[]    @relation("paiements_user_updatedTousers")
  students_students_user_createdTousers         students[]     @relation("students_user_createdTousers")
  students_students_user_updatedTousers         students[]     @relation("students_user_updatedTousers")
  users_users_parent_idTousers                  users?         @relation("users_parent_idTousers", fields: [parent_id], references: [id], map: "users_parent_id_foreign")
  other_users_users_parent_idTousers            users[]        @relation("users_parent_idTousers")
  users_users_user_createdTousers               users?         @relation("users_user_createdTousers", fields: [user_created], references: [id], map: "users_user_created_foreign")
  other_users_users_user_createdTousers         users[]        @relation("users_user_createdTousers")
  users_users_user_updatedTousers               users?         @relation("users_user_updatedTousers", fields: [user_updated], references: [id], map: "users_user_updated_foreign")
  other_users_users_user_updatedTousers         users[]        @relation("users_user_updatedTousers")

  @@index([parent_id], map: "users_parent_id_foreign")
  @@index([user_created], map: "users_user_created_foreign")
  @@index([user_updated], map: "users_user_updated_foreign")
}

enum students_sex {
  M
  F
}

enum users_sex {
  M
  F
}
