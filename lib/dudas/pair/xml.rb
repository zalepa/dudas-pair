require 'crack'
require 'json'

module Dudas

  module PAIR

    class XML

      attr_reader :hash

      MAPPING = {
        'PatentApplicationData'            => 'pair_data',

          'FileHeader'                       => 'file_header',
              'FileCreationTimeStamp'            => 'file_creation_time_stamp',
          
          'CorrespondenceInfo'               => 'correspondence',
          
        'PublicViewingIndicator'           => 'is_public',
        'FirstActionPrediction'            => 'first_action_prediction',
        'TelephoneNumber'                  => 'phone',                               # Registered attorney telephone number using a 12 character string, i.e. "703-412-6457"
        'SupplementalContents'             => 'supplemental_contents',
        'SupplementalContent'              => 'supplemental_content',
        'SupplementalContentCategory'      => 'supplemental_content_category',
        'ApplicationStatusCode'            => 'status_code',
        'ScoreFileCategory'                => 'score_file_category',
        'SupplementalContentQuantity'      => 'supplemental_content_quantity',
        'RegistrationNumber'               => 'registration_number',
        'EarliestPublicationYear'          => 'earliest_publication_year',
        'PublicationSequenceNumber'        => 'publication_sequence_number',
        'PublicationKindCode'              => 'publication_kind_code',
        'PublicationDate'                  => 'publication_date',
        'ForeignPriorityDate'              => 'foreign_priority_date',
        'ForeignPriorityNumber'            => 'foreign_priority_number',
        'PostalCode'                       => 'post_code', #
        'PatentSubclass'                   => 'subclass',
        'PatentClass'                      => 'class',
        'ParentContinuityList'             => 'parent_continuity_list',
        'ParentContinuity'                 => 'parent_continuity',
        'ApplicationStatusText'            => 'status_text',
        'ApplicationStatusDate'            => 'status_date',
        'ApplicationBibliographicData'     => 'bibliography', # Bib data for a patent/app
        'BeginPageNumber'                  => 'begin_page_number',
        'PageQuantity'                     => 'page_quantity',
        'PageOffsetQuantity'               => 'page_offset_quantity',
        'MailRoomDate'                     => 'mail_room_date',
        'FileWrapperLocationChangeDate'    => 'file_wrapper_location_change_date',
        'FileWrapperLocationCode'          => 'file_wrapper_location_code',
        'FileWrapperDocumentCode'          => 'file_wrapper_document_code',
        'ImageFileWrapperList'             => 'image_file_wrapper_list',
        'ImageFileWrapperDocument'         => 'image_file_wrapper_document',
        'IssueDate'                        => 'issue_date',
        'Inventors'                        => 'inventors',
        'Inventor'                         => 'inventor',
        'InventorName'                     => 'name', # sub
        'InventorAddress'                  => 'address', # these just "subclass" off of <AddressType>
        'InventorContact'                  => 'contact', # these just "subclass" off of <ContactType>
        'InventionTitle'                   => 'title',
        'InventionSubjectMatterType'       => 'subject_matter_type',
        'GroupArtUnit'                     => 'art_unit',
        'ForeignPriorities'                => 'foreign_priorities',
        'ForeignPriority'                  => 'foreign_priority',
        'PredictionTimePeriod'             => 'prediction_time_period',
        'FileContentHistories'             => 'file_content_histories',
        'FileContentHistory'               => 'file_content_history',
        'TransactionDate'                  => 'transaction_date',
        'TransactionDescription'           => 'transaction_description',
        'StatusNumber'                     => 'status_number',
        'StatusDescription'                => 'status_description',
        'DocumentDescription'              => 'document_description',
        'DocumentCategory'                 => 'document_category',
        'CustomerNumber'                   => 'customer_number',
        'PersonName'                       => 'person_name',
        'OrganizationName'                 => 'organization_name',
        'CorrespondenceAddress'            => 'address', # these just "subclass" off of <AddressType>
        'CorrespondenceContact'            => 'contact', # these just "subclass" off of <ContactType>
        'Continuity'                       => 'continuity',
        'ConfirmationNumber'               => 'confirmation_number',
        'ChildContinuityList'              => 'child_continuity_list',
        'ChildContinuity'                  => 'child_continuity',
        'Attorneys'                        => 'attorneys',
        'Attorney'                         => 'attorney',
        'AttorneyDocketNumber'             => 'docket_number',
        'AttorneyContact'                  => 'contact', # these just "subclass" off of <ContactType>
        'ApplicationStorageFormat'         => 'storage_format',
        'AttorneyName'                     => 'name',
        'ExaminerName'                     => 'examiner_name',
        'WIPOPublications'                 => 'wipo_publications',
        'WIPOPublicationNumber'            => 'wipo_publication_number',
        'WIPOPublicationDate'              => 'wipo_publication_date',
        'WIPOPublication'                  => 'wipo_publication',
        'PCTFilingDate'                    => 'pct_filing_date',
        'PCTApplicationNumber'             => 'pct_application_number',
        'RelationType'                     => 'relation_type',
        'RelatedPublication'               => 'related_publication',
        'UtilityModelBasis'                => 'utility_model_basis',
        'ChildDocument'                    => 'child_document',
        'ParentDocument'                   => 'parent_document',
        'ContinuityType'                   => 'continuity_type',
        'ApplicationNumber'                => 'serial',
        'ApplicationCategory'              => 'application_category',
        'PatentNumber'                     => 'patent_number',
        'FilingDate'                       => 'filing_date',
        'Section371Sub102eDate'            => 'section371_sub102e_date',
        'ContinuityStatus'                 => 'continuity_status',
        'AddressType'                      => 'address', # root class
        'languageCode'                     => 'code', #
        'AddressLine'                      => 'street_address', #
        'sequenceNumber'                   => 'sequence_number',
        'City'                             => 'city',
        'GeographicRegion'                 => 'region',
        'GeographicRegionType'             => 'type', #
        'GeographicRegionName'             => 'name', #
        'GeographicRegionCode'             => 'code', #
        'regionCode'                       => 'code', # not in .xsd
        'regionName'                       => 'name', # not in .xsd
        'Country'                          => 'country',
        'CountryType'                      => 'type', #
        'CountryName'                      => 'name', #
        'CountryCode'                      => 'code', #
        'countryType'                      => 'type', # not in xsd
        'countryName'                      => 'name', # not in xsd
        'countryCode'                      => 'code', # not in xsd
        'OrganizationNameType'             => 'organization_name_type',
        'OrganizationFullName'             => 'organization_full_name',
        'OrganizationShortName'            => 'organization_short_name',
        'PersonNameType'                   => 'person_name_type',
        'FullName'                         => 'full_name',
        'Suffix'                           => 'suffix',
        'FirstName'                        => 'first', #
        'PreferredFirstName'               => 'preferred_first',
        'MiddleName'                       => 'middle', #
        'LastName'                         => 'last', #
        'SecondLastName'                   => 'second_last_name',
        'Prefix'                           => 'prefix',
        'Initials'                         => 'initials',
        'ContactType'                      => 'contact',
        'URL'                              => 'url',
        'EMail'                            => 'e_mail',
        'Fax'                              => 'fax',
        'Phone'                            => 'phone',
        'PhoneType'                        => 'phone_type',
        'Extension'                        => 'extension',
        'phoneKind'                        => 'phone_kind',
        'OtherContact'                     => 'other_contact',
        'ISOLanguageCodeType'              => 'iso_language_code_type'
      }

      def initialize(xml_string)
        @hash = Crack::XML.parse(clean(xml_string))
      end
      
      def to_json
        @hash.to_json
      end


      private

        def clean(xml_string)
          cleaned = xml_string.gsub('<pair:', '<').gsub('</pair:', '</')
          MAPPING.each do |o, n|
            alternative = o[0].downcase + o[1..-1]
            cleaned = cleaned.gsub(/<(#{o}|#{alternative})/, "<#{n}").gsub(/<\/(#{o}|#{alternative})/, "</#{n}")
          end
          cleaned
        end

    end
  end

end