module Dudas

  module PAIR

    class XML

      attr_reader :hash

      MAPPING = {
        'PatentApplicationData' => 'patent_application_data',
        'FileHeader' => 'file_header',
        'PublicViewingIndicator' => 'public_viewing_indicator',
        'FirstActionPrediction' => 'first_action_prediction',
        'TelephoneNumber' => 'telephone_number',
        'SupplementalContents' => 'supplemental_contents',
        'SupplementalContent' => 'supplemental_content',
        'SupplementalContentCategory' => 'supplemental_content_category',
        'ApplicationStatusCode' => 'application_status_code',
        'ScoreFileCategory' => 'score_file_category',
        'SupplementalContentQuantity' => 'supplemental_content_quantity',
        'RegistrationNumber' => 'registration_number',
        'EarliestPublicationYear' => 'earliest_publication_year',
        'PublicationSequenceNumber' => 'publication_sequence_number',
        'PublicationKindCode' => 'publication_kind_code',
        'PublicationDate' => 'publication_date',
        'ForeignPriorityDate' => 'foreign_priority_date',
        'ForeignPriorityNumber' => 'foreign_priority_number',
        'PostalCode' => 'postal_code',
        'PatentSubclass' => 'patent_subclass',
        'PatentClass' => 'patent_class',
        'ParentContinuityList' => 'parent_continuity_list',
        'ParentContinuity' => 'parent_continuity',
        'ApplicationStatusText' => 'application_status_text',
        'ApplicationStatusDate' => 'application_status_date',
        'ApplicationBibliographicData' => 'application_bibliographic_data',
        'BeginPageNumber' => 'begin_page_number',
        'PageQuantity' => 'page_quantity',
        'PageOffsetQuantity' => 'page_offset_quantity',
        'MailRoomDate' => 'mail_room_date',
        'FileWrapperLocationChangeDate' => 'file_wrapper_location_change_date',
        'FileWrapperLocationCode' => 'file_wrapper_location_code',
        'FileWrapperDocumentCode' => 'file_wrapper_document_code',
        'ImageFileWrapperList' => 'image_file_wrapper_list',
        'ImageFileWrapperDocument' => 'image_file_wrapper_document',
        'IssueDate' => 'issue_date',
        'Inventors' => 'inventors',
        'Inventor' => 'inventor',
        'InventorName' => 'inventor_name',
        'InventorAddress' => 'inventor_address',
        'InventorContact' => 'inventor_contact',
        'InventionTitle' => 'invention_title',
        'InventionSubjectMatterType' => 'invention_subject_matter_type',
        'GroupArtUnit' => 'group_art_unit',
        'ForeignPriorities' => 'foreign_priorities',
        'ForeignPriority' => 'foreign_priority',
        'PredictionTimePeriod' => 'prediction_time_period',
        'FileCreationTimeStamp' => 'file_creation_time_stamp',
        'FileContentHistories' => 'file_content_histories',
        'FileContentHistory' => 'file_content_history',
        'TransactionDate' => 'transaction_date',
        'TransactionDescription' => 'transaction_description',
        'StatusNumber' => 'status_number',
        'StatusDescription' => 'status_description',
        'DocumentDescription' => 'document_description',
        'DocumentCategory' => 'document_category',
        'CustomerNumber' => 'customer_number',
        'CorrespondenceInfo' => 'correspondence_info',
        'PersonName' => 'person_name',
        'OrganizationName' => 'organization_name',
        'CorrespondenceAddress' => 'correspondence_address',
        'CorrespondenceContact' => 'correspondence_contact',
        'Continuity' => 'continuity',
        'ConfirmationNumber' => 'confirmation_number',
        'ChildContinuityList' => 'child_continuity_list',
        'ChildContinuity' => 'child_continuity',
        'Attorneys' => 'attorneys',
        'Attorney' => 'attorney',
        'AttorneyDocketNumber' => 'attorney_docket_number',
        'AttorneyContact' => 'attorney_contact',
        'ApplicationStorageFormat' => 'application_storage_format',
        'AttorneyName' => 'attorney_name',
        'ExaminerName' => 'examiner_name',
        'WIPOPublications' => 'wipo_publications',
        'WIPOPublicationNumber' => 'wipo_publication_number',
        'WIPOPublicationDate' => 'wipo_publication_date',
        'WIPOPublication' => 'wipo_publication',
        'PCTFilingDate' => 'pct_filing_date',
        'PCTApplicationNumber' => 'pct_application_number',
        'RelationType' => 'relation_type',
        'RelatedPublication' => 'related_publication',
        'UtilityModelBasis' => 'utility_model_basis',
        'ChildDocument' => 'child_document',
        'ParentDocument' => 'parent_document',
        'ContinuityType' => 'continuity_type',
        'ApplicationNumber' => 'application_number',
        'ApplicationCategory' => 'application_category',
        'PatentNumber' => 'patent_number',
        'FilingDate' => 'filing_date',
        'Section371Sub102eDate' => 'section371_sub102e_date',
        'ContinuityStatus' => 'continuity_status',
        'AddressType' => 'address_type',
        'languageCode' => 'language_code',
        'AddressLine' => 'address_line',
        'sequenceNumber' => 'sequence_number',
        'City' => 'city',
        'GeographicRegion' => 'geographic_region',
        'GeographicRegionType' => 'geographic_region_type',
        'GeographicRegionName' => 'geographic_region_name',
        'GeographicRegionCode' => 'geographic_region_code',
        'Country' => 'country',
        'CountryType' => 'country_type',
        'CountryName' => 'country_name',
        'CountryCode' => 'country_code',
        'OrganizationNameType' => 'organization_name_type',
        'OrganizationFullName' => 'organization_full_name',
        'OrganizationShortName' => 'organization_short_name',
        'PersonNameType' => 'person_name_type',
        'FullName' => 'full_name',
        'Suffix' => 'suffix',
        'FirstName' => 'first_name',
        'PreferredFirstName' => 'preferred_first_name',
        'MiddleName' => 'middle_name',
        'LastName' => 'last_name',
        'SecondLastName' => 'second_last_name',
        'Prefix' => 'prefix',
        'Initials' => 'initials',
        'ContactType' => 'contact_type',
        'URL' => 'url',
        'EMail' => 'e_mail',
        'Fax' => 'fax',
        'Phone' => 'phone',
        'PhoneType' => 'phone_type',
        'Extension' => 'extension',
        'phoneKind' => 'phone_kind',
        'OtherContact' => 'other_contact',
        'ISOLanguageCodeType' => 'iso_language_code_type'
      }

      def initialize(xml_string)
        @hash = Crack::XML.parse(clean(xml_string))
      end


      private

        def clean(xml_string)
          cleaned = xml_string.gsub('<pair:', '<').gsub('</pair:', '</')
          MAPPING.each do |o, n|
            cleaned = cleaned.gsub(/<#{o}/, "<#{n}").gsub(/<\/#{o}/, "</#{n}")
          end
          cleaned
        end

    end
  end

end