package org.upgrad.upstac.testrequests.consultation;

import lombok.Data;

import javax.validation.constraints.NotNull;
import java.time.LocalDate;

@Data
public class CreateConsultationRequest {

    @NotNull
    private DoctorSuggestion suggestion;

    private String comments;
    private LocalDate UpdateOn = LocalDate.now();
}
