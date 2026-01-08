public with sharing class SupportTicketController {

    /*
     * Fetches paginated Case records for Support Center UI.
     * Designed to efficiently handle large datasets.
     */
    @AuraEnabled(cacheable=true)
    public static List<Case> getTickets(Integer pageSize, Integer pageNumber) {

        if (pageSize == null || pageNumber == null) {
            return new List<Case>();
        }

        Integer offsetValue = (pageNumber - 1) * pageSize;

        return [
            SELECT Id, Subject, Status, Priority, CreatedDate
            FROM Case
            ORDER BY CreatedDate DESC
            LIMIT :pageSize
            OFFSET :offsetValue
        ];
    }
}
