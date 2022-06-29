package org.upgrad.upstac.testrequests.consultation;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;
import org.upgrad.upstac.testrequests.TestRequest;
import org.upgrad.upstac.testrequests.lab.LabResult;
import org.upgrad.upstac.users.User;

import javax.transaction.Transactional;

@Service
@Validated
public class ConsultationService {

    @Autowired
    private ConsultationRepository consultationRepository;

    private static Logger logger = LoggerFactory.getLogger(ConsultationService.class);


    @Transactional
    public Consultation assignForConsultation( TestRequest testRequest, User doctor) {
        //Implement this method to assign the consultation service
        // create object of Consultation class and use the setter methods to set doctor and testRequest details
        // make use of save() method of consultationRepository to return the Consultation object
        Consultation assignConsultation = new Consultation();

        assignConsultation.setDoctor(doctor);

        assignConsultation.setRequest(testRequest);

        return consultationRepository.save(assignConsultation);
        //return null; // replace this line with your code


    }

    public Consultation updateConsultation(TestRequest testRequest , CreateConsultationRequest createConsultationRequest) {
        //Implement this method to update the consultation
        // create an object of Consultation and make use of setters to set Suggestion, Comments, and UpdatedOn values
        // make use of save() method of consultationRepository to return the Consultation object
       // return null; // replace this line with your code
        Consultation consultationResult = new Consultation();

        consultationResult.setSuggestion(createConsultationRequest.getSuggestion());
        consultationResult.setComments(createConsultationRequest.getComments());
        consultationResult.setUpdatedOn(createConsultationRequest.getUpdateOn());
        consultationResult.setId(testRequest.getConsultation().getId());
        consultationResult.setDoctor(testRequest.getConsultation().getDoctor());
        consultationResult.setRequest(testRequest);

        return consultationRepository.save(consultationResult);
    }


}
