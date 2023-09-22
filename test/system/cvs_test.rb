require "application_system_test_case"

class CvsTest < ApplicationSystemTestCase
  setup do
    @cv = cvs(:one)
  end

  test "visiting the index" do
    visit cvs_url
    assert_selector "h1", text: "Cvs"
  end

  test "should create cv" do
    visit cvs_url
    click_on "New cv"

    fill_in "Certification", with: @cv.certification
    fill_in "Cvemail", with: @cv.cvemail
    fill_in "Duration", with: @cv.duration
    fill_in "Email", with: @cv.email
    fill_in "Experience", with: @cv.experience
    fill_in "Fullname", with: @cv.fullname
    fill_in "Image", with: @cv.image
    fill_in "Major", with: @cv.major
    fill_in "Phone", with: @cv.phone
    fill_in "Schoolcollege", with: @cv.schoolcollege
    fill_in "Skills", with: @cv.skills
    fill_in "Sociallink", with: @cv.sociallink
    click_on "Create Cv"

    assert_text "Cv was successfully created"
    click_on "Back"
  end

  test "should update Cv" do
    visit cv_url(@cv)
    click_on "Edit this cv", match: :first

    fill_in "Certification", with: @cv.certification
    fill_in "Cvemail", with: @cv.cvemail
    fill_in "Duration", with: @cv.duration
    fill_in "Email", with: @cv.email
    fill_in "Experience", with: @cv.experience
    fill_in "Fullname", with: @cv.fullname
    fill_in "Image", with: @cv.image
    fill_in "Major", with: @cv.major
    fill_in "Phone", with: @cv.phone
    fill_in "Schoolcollege", with: @cv.schoolcollege
    fill_in "Skills", with: @cv.skills
    fill_in "Sociallink", with: @cv.sociallink
    click_on "Update Cv"

    assert_text "Cv was successfully updated"
    click_on "Back"
  end

  test "should destroy Cv" do
    visit cv_url(@cv)
    click_on "Destroy this cv", match: :first

    assert_text "Cv was successfully destroyed"
  end
end
