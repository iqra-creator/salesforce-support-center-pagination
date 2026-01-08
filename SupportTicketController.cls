public class SupportTicketController {

    @AuraEnabled
    public static List<Case> fetchTickets(Integer limitSize, Integer offsetSize) {
        return [
            SELECT Id, Subject, Status
            FROM Case
            ORDER BY CreatedDate DESC
            LIMIT :limitSize OFFSET :offsetSize
        ];
    }
}
